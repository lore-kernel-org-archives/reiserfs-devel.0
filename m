From: Kevin Bealer <kevinbealer@yahoo.com>
Subject: The main 'set' version of SkipTree.H
Date: Wed, 7 May 2003 21:29:03 -0700 (PDT)
Message-ID: <20030508042903.94396.qmail@web40006.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13997-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com, jmacd <jmacd@cs.berkeley.edu>
Cc: kevinbealer@yahoo.com


The first file.  SkipTree with insert.  I have not
implemented find() etc. but they are identical to
the 'simple' binary tree (the one your mother told
you about...)

Kevin

#ifndef _SkipTree_H_
#define _SkipTree_H_

#include <stdlib.h>
#include <iostream>
#include <sstream>
#include <vector>

using std::cout;
using std::endl;
using std::string;
using std::ostringstream;
using std::vector;

int skiptree_debug = 1;

template<class T>
class SkipTree {
public:
	SkipTree(void)
		: _top(0)
	{
	}
	
	~SkipTree(void)
	{
	}
	
	void insert(T & elem)
	{
		skipnode * node = new skipnode;
		
		node->value = elem;
		node->left  = 0;
		node->right = 0;
		node->level = _get_level();
		
		_insert(node);
	}
	
	void print(void)
	{
		if(_top)
			_print(_top);
	}
	
	void buildvect(vector<T> & v)
	{
		if(_top)
			_buildvect(_top, v);
	}
	
private:
	struct skipnode {
	public:
		string str(void)
		{
			ostringstream oss;
			
			oss << "(" << value;
			
			if (level) {
				oss << "," << level;
			}
			
			oss << ")";
			
			return oss.str();
		}
		
		T          value;
		skipnode * left;
		skipnode * right;
		int        level;
	};
	
	int _get_level(void)
	{
		const int branch_factor = 5;
		
		int level = 0;
		
		while(rand() < (RAND_MAX / branch_factor)) {
			level++;
		}
		
		return level;
	}
	
	// Ordinary insert function
	
	void ordinary_insert(skipnode * elem)
	{
		skipnode * parent = _top;
		
		bool done = false;
		
		while(! done) {
			if ((parent->value) > elem->value) {
				if (parent->left) {
					parent = parent->left;
				} else {
					parent->left = elem;
					done = true;
				}
			} else {
				if (parent->right) {
					parent = parent->right;
				} else {
					parent->right = elem;
					done = true;
				}
			}
		}
	}

	// SkipTree version
	
	void _insert(skipnode * elem)
	{
		if (! _top) {
			_insdbg(elem);
			_top = elem;
			return;
		}
		
		if (elem->level > _top->level) {
			skipnode * oldtop = _top;
			
			_insdbg(elem);
			_top = elem;
			
			_divideLR(elem->value, elem, oldtop);
			return;
		}
		
		skipnode * parent = _top;
		
		bool done = false;
		
		while(! done) {
			if ((parent->value) > elem->value) {
				if (parent->left) {
					if (parent->left->level >= elem->level) {
						parent = parent->left;
					} else {
						skipnode * oldtree = parent->left;
						
						_insdbg(parent, elem);
						parent->left = elem;
						
						_divideLR(elem->value, elem, oldtree);
						done = true;
					}
				} else {
					_insdbg(parent, elem);
					parent->left = elem;
					done = true;
				}
			} else {
				if (parent->right) {
					if (parent->right->level >= elem->level) {
						parent = parent->right;
					} else {
						skipnode * oldtree = parent->right;
						
						_insdbg(parent, elem);
						parent->right = elem;
						
						_divideLR(elem->value, elem, oldtree);
						done = true;
					}
				} else {
					_insdbg(parent, elem);
					parent->right = elem;
					done = true;
				}
			}
		}
	}
	
	void _divideLR(T & splitvalue, skipnode * bothrecv,
skipnode * oldtree)
	{
		_divdbg("LR", splitvalue, bothrecv, bothrecv,
oldtree);
		
		if (oldtree->value < splitvalue) {
			bothrecv->left = oldtree;
			_divideRR(splitvalue, oldtree, bothrecv,
oldtree->right);
		} else {
			bothrecv->right = oldtree;
			_divideLL(splitvalue, bothrecv, oldtree,
oldtree->left);
		}
	}
	
	void _divideLL(T & splitvalue, skipnode * leftrecv,
skipnode * rightrecv, skipnode * oldtree)
	{
		_divdbg("LL", splitvalue, leftrecv, rightrecv,
oldtree);

		if (! oldtree) {
			leftrecv->left = 0;
			rightrecv->left = 0;
		} else if (oldtree->value < splitvalue) {
			leftrecv->left = oldtree;
			_divideRL(splitvalue, oldtree, rightrecv,
oldtree->right);
		} else {
			rightrecv->left = oldtree;
			_divideLL(splitvalue, leftrecv, oldtree,
oldtree->left);
		}
	}
	
	void _divideRR(T & splitvalue, skipnode * leftrecv,
skipnode * rightrecv, skipnode * oldtree)
	{
		_divdbg("RR", splitvalue, leftrecv, rightrecv,
oldtree);

		if (! oldtree) {
			leftrecv->right  = 0;
			rightrecv->right = 0;
		} else if (oldtree->value < splitvalue) {
			leftrecv->right = oldtree;
			_divideRR(splitvalue, oldtree, rightrecv,
oldtree->right);
		} else {
			rightrecv->right = oldtree;
			_divideRL(splitvalue, leftrecv, oldtree,
oldtree->left);
		}
	}
	
#if 0
	void _divideRL(T & splitvalue, skipnode * leftrecv,
skipnode * rightrecv, skipnode * oldtree)
	{
		_divdbg("RL", splitvalue, leftrecv, rightrecv,
oldtree);
		
		if (! oldtree) {
			leftrecv->right = 0;
			rightrecv->left = 0;
		} else if (oldtree->value < splitvalue) {
			leftrecv->right = oldtree;
			_divideRL(splitvalue, oldtree, rightrecv,
oldtree->right);
		} else {
			rightrecv->left = oldtree;
			_divideRL(splitvalue, leftrecv, oldtree,
oldtree->left);
		}
	}
#else
	void _divideRL(T & splitvalue, skipnode * leftrecv,
skipnode * rightrecv, skipnode * oldtree)
	{
		_divdbg("RL", splitvalue, leftrecv, rightrecv,
oldtree);
		
		while(oldtree) {
			if (oldtree->value < splitvalue) {
				leftrecv->right = oldtree;
				leftrecv = oldtree;
				oldtree  = oldtree->right;
			} else {
				rightrecv->left = oldtree;
				rightrecv = oldtree;
				oldtree = oldtree->left;
			}
		}
		
		leftrecv->right = 0;
		rightrecv->left = 0;
	}
#endif
	void _divdbg(char * divtype, T & V, skipnode * L,
skipnode * R, skipnode * OT)
	{
		if (skiptree_debug) {
			cout << "dividing subtree: ";
			
			if (OT) {
				cout << OT->str();
			} else {
				cout << "NULL";
			}
			
			const char * leftstr = (divtype[0] == 'L') ? "left"
: "right";
			const char * rightstr = (divtype[1] == 'L') ?
"left" : "right";
			
			cout << ", splitting on value " << V;
			cout << ", less go to " << L->str() << "->" <<
leftstr;
			cout << ", greater to " << R->str() << "->" <<
rightstr;
			cout << endl;
		}
	}
	
	void _insdbg(skipnode * elem)
	{
		if (skiptree_debug) {
			cout << "Inserting " << elem->str() << " as new top
node." << endl;
		}
	}
	
	void _insdbg(skipnode * parent, skipnode * elem)
	{
		if (skiptree_debug) {
			cout << "Inserting " << elem->str() << " under node
" << parent->str() << "." << endl;
		}
	}
	
	void _print(skipnode * tree)
	{
		if (tree->left)
			_print(tree->left);
		
		cout << tree->value << " : " << tree->level << "\n";
		
		if (tree->right)
			_print(tree->right);
	}
	
	void _buildvect(skipnode * tree, vector<T> & v)
	{
		if (tree->left)
			_buildvect(tree->left, v);
		
		v.push_back(tree->value);
		
		if (tree->right)
			_buildvect(tree->right, v);
	}
	
	
	// DATA
	
	skipnode * _top;
};

#endif




__________________________________
Do you Yahoo!?
The New Yahoo! Search - Faster. Easier. Bingo.
http://search.yahoo.com
