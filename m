From: Pallavi <pallavidalya@gmail.com>
Subject: reading data disk blocks of a file
Date: Wed, 22 Dec 2004 21:08:19 +0530
Message-ID: <5fe093a5041222073823cdef43@mail.gmail.com>
Reply-To: Pallavi <pallavidalya@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22881-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

hello,
what are the internal operations to real a file..I understand that the
semantic layer
converts a filename into a key but where in the source code is the
implementation of this semantic layer found and how does it exactly
convert the name to a key?

A key will lead me to a node. That node had range of keys each
corresponding to an item.The key I get will point to an item. Let's
say the item contains data, but given that the item size is limited
the data may be spread  across items nodes. How are all the data
blocks where data from particular file is stored identified.
Basically i want to know how are all the data blocks of a file are
accessed and read?
