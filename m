From: Hans Reiser <reiser@namesys.com>
Subject: viewprinting: what format should views be stored in?
Date: Sun, 15 Aug 2004 17:15:48 -0700
Message-ID: <411FFCB4.2060400@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20315-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: George Beshers <gbeshers@comcast.net>, ReiserFS List <reiserfs-list@namesys.com>

It is very important that we have something simple that reuses code for 
this purpose, and it also needs to be scalable.  That is, we need to be 
able to determine in insignificant time whether a file passes through a 
mask consisting of a million files.

One approach would be to use a format similar to that for chroot, that 
is, to keep the format we use for directory trees now, and use it for 
storing the mask.  This raises the question: how would the format for 
the mask differ from that of the underlying filesystem.

Another approach is to use stem compressed names, or some other unique 
within the fs format for the mask.

We need to be able to support specifying a mask that allows any file 
within a given directory to be visible.  That is, we need to support 
dirname/* but we don't yet need to support dirname/foo.*

We probably don't want to allow symbolic links to be followed unless 
where they point to is within the mask.

I want minimal code but I want it to be treelike in its performance 
scalability.

Ideas?
