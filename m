From: Newsmail <newsmail@satimex.tvnet.hu>
Subject: lvm array --> what if one HD fails
Date: Mon, 22 Jul 2002 12:19:54 +0100
Message-ID: <5.0.2.1.2.20020722111528.01cf4640@pop.tvnet.hu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11067-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

I have an lvm array with many HDs one after the other. it is a simple 
linear array, no striping. what happens if one HD dies and I remove it from 
the array? could reiserfsck correct this? what happens to the metadata? as 
I know it lies all over the space because of the tree structure. could this 
be corrected? :)
regards,
greg



