//
//  main.cpp
//  list1
//
//  Created by lzmbp1 on 16/7/27.
//  Copyright © 2016年 lzmbp1. All rights reserved.
//

#include <iostream>
#include <stack>
using namespace std;

struct ListNode{
    int m_nValue;
    ListNode *m_pNext;
};

/**
 *  往链表的末尾中添加一个节点
 *
 *  @param pHead 一个指向指针的指针。当我们往一个空链表中插入一个结点时，新插入的结点就是链表的头指针。
    由于此时会改动头指针，因此必须把pHead参数设为指向指针的指针，否则出了这个函数pHead仍然是一个空指针
 *  @param value
 */

void AddToTail(ListNode** pHead,int value){
//    cout<<(*pHead)->m_nValue<<endl;
    ListNode *pNew = new ListNode();
    pNew->m_nValue = value;
    pNew->m_pNext = NULL;
    
    //如果不在下面添加(*pHead)->m_nValue == 0)，链表总会有一个0在开始的结点
    if (*pHead == NULL || ((*pHead)->m_nValue == 0)) {
        *pHead = pNew;
    } else {
        ListNode *pNode = *pHead;
        while (pNode->m_pNext != NULL) {
            pNode = pNode->m_pNext;
        }
        pNode->m_pNext = pNew;
    }
}

//找到链表的第i个结点沿着指向下一个结点的指针遍历链表，时间效率为O(n)
void RemoveNode(ListNode **pHead,int value){
    if (pHead == NULL || *pHead == NULL) {
        return;
    }
    
    ListNode *pToBeDeleted = NULL;
    if ((*pHead)->m_nValue == value) {
        pToBeDeleted = *pHead;
        *pHead = (*pHead)->m_pNext;
    }else{
        ListNode *pNode = *pHead;
        while (pNode->m_pNext!= NULL && pNode->m_pNext->m_nValue != value) {
            pNode = pNode->m_pNext;
        }
        if (pNode->m_pNext != NULL && pNode->m_pNext->m_nValue == value) {
            pToBeDeleted = pNode->m_pNext;
            pNode->m_pNext = pNode->m_pNext->m_pNext;
        }
    }
    
    if (pToBeDeleted != NULL) {
        delete pToBeDeleted;
        pToBeDeleted = NULL;
    }
}

//利用栈的“后进先出”的特点，遍历所有结点，压入栈，出来的时候顺序就反过来了
void PrintListReversingly_Recursively(ListNode *pHead){
    
    stack<ListNode *> nodes;
    ListNode *pNode = pHead;
    
    while (pNode != NULL) {
        nodes.push(pNode);
        pNode = pNode->m_pNext;
    }
    
    while (!nodes.empty()) {
        pNode = nodes.top();
        cout<<pNode->m_nValue<<endl;
        nodes.pop();
    }
}

////(递归法，(递归本质上是一个栈结构)，鲁棒性不好)从尾到头反向输出一个链表,不修改链表的状态
////当链表非常长的时候，就会导致函数调用的层级很深，从而有可能导致函数调用栈溢出
//void PrintListReversingly_Recursively(ListNode *pHead){
//    if (pHead != NULL) {
//        if (pHead->m_pNext != NULL) {
//            PrintListReversingly_Recursively(pHead->m_pNext);
//        }
//        cout<<pHead->m_nValue<<endl;
//    }
//}
int main(int argc, const char * argv[]) {
    ListNode *list = new ListNode();
    AddToTail(&list, 5);
    AddToTail(&list, 6);
    AddToTail(&list, 7);
    AddToTail(&list, 8);
    AddToTail(&list, 9);
    AddToTail(&list, 0);
//    cout <<list->m_nValue <<"00\n";
//    while (list->m_pNext != NULL) {
//        cout <<list->m_pNext->m_nValue <<"\n";
//        list->m_pNext = list->m_pNext->m_pNext;
//    }
    RemoveNode(&list, 0);
//    cout <<list->m_nValue <<"00\n";
//    RemoveNode(&list, 5);
//    RemoveNode(&list, 8);
//    cout <<list->m_nValue <<"00\n";
//    while (list->m_pNext != NULL) {
//        cout <<list->m_pNext->m_nValue <<"\n";
//        list->m_pNext = list->m_pNext->m_pNext;
//    }
    
    PrintListReversingly_Recursively(list);
    
    return 0;
}











