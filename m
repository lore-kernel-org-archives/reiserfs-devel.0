From: Kevin Bealer <kevinbealer@yahoo.com>
Subject: A simple test driver for SkipTree.
Date: Wed, 7 May 2003 22:15:56 -0700 (PDT)
Message-ID: <20030508051556.39132.qmail@web40007.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13998-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com, jmacd <jmacd@cs.berkeley.edu>
Cc: kevinbealer@yahoo.com

*******

Sorry not to mention this till now;  I work for the 
government through a vendor company.  All of this 
SkipTree work was done at home and is of no commercial
value to my company, as far as I know, but let me make
sure it is not encumbered before using it.

For my own interests, let me state for the record that
*I* have no interest in remuneration for this work.
It is copyright me, but I don't intend to restrict it
unless my company demands such.

Kevin Bealer

*******

This is the simple test driver for SkipTrees.  This
file together with SkipTree.H comprise a full program.

You'll notice the file is set up for a basic
comparison
against the STL.

With GCC 3.2 and -O2 (no other optimizations), this
runs in between 2 or 3 sec with Skip Tree and about
4 sec with the (red/black tree) set<> from the STL.

Not a scientific test, not a realistic load, etc.

By the way, the 'worst case' for non-balanced
binary trees, and (to a much lesser degree)
for most balanced binary trees, is in-order
insertions, or so I've heard..

But in-order insertions actually seem to run
faster on this implementation of SkipTree,
probably due to cache effects.  This should
hold over to disk, of course depending on
many factors, etc, which is good because
they are fairly common in file systems etc.

Anyway, here's the code.  Most of the
commented out chunks do something useful
and obvious if enabled.

Compiled with:

g++ -O2 -o testskip test_skiptree.C

Kevin Bealer

---------

#include "SkipTree.H"
#include <set>
using std::set;

int main(int argc, char **argv)
{
	SkipTree<int> tree;
	set<int> rbtree;
	
	skiptree_debug = 0;
	
	cout << "starting." << endl;
	
	for(int i = 0; i<1000000; i++) {
		tree.insert(i);
		//rbtree.insert(i);
	}
	
	cout << "got nodes." << endl;

// 	vector<int> v;
// 	tree.buildvect(v);
	
// 	cout << "got list." << endl;
	
// 	cout << "list size " << v.size() << endl;
	
	//for(vector<int>::iterator i = v.begin(); i !=
v.end(); i++) {
	//cout << (*i) << "\n";
	//}
	
	return 0;
}




__________________________________
Do you Yahoo!?
The New Yahoo! Search - Faster. Easier. Bingo.
http://search.yahoo.com
