From: Soeren Sonnenburg <reiserfs@nn7.de>
Subject: free space seems wrong...
Date: 05 Mar 2003 18:53:24 +0100
Message-ID: <1046886804.23752.25.camel@calculon>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13081-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi.

I get

is_leaf: free space seems wrong: level=1, nr_items=7, free_space=3468 rdkey 
vs-5150: search_by_key: invalid format found in block 4792161. Fsck?
is_leaf: free space seems wrong: level=1, nr_items=7, free_space=3468 rdkey 
vs-5150: search_by_key: invalid format found in block 4792161. Fsck?

when accessing a certain directory using du and on the prompt
Input/output error.

 This does not happen when I iterate over the files by just using find /
...
 
The disk was full somewhen but now is only half full.

Should I be worried / is it necessary to fix the filesystem ?
The problem is, this filesystem is like 2-3 years old and was converted
to reiserfs 3.6 maybe a year ago...but as it is a production environment
I would not want to put it down at all...

Thanks for any help,
Soeren.

