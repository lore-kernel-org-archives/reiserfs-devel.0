From: David Garamond <davegaramond@icqmail.com>
Subject: transaction and atomicity
Date: Sat, 04 May 2002 04:21:42 +0700
Message-ID: <3CD2FF66.50100@icqmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10227-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

since reiserfs is a transactional filesystem, i wonder whether it 
exposes a "transaction api". or if not, can i somehow control write 
caching to make several filesystem modification operations committed to 
disk as a single group? [or will this be tackled in one of reiserfs 
version 4?]

if any of the above is not possible, is there a way to do filesystem 
operations grouping so they become more reliable (all-or-nothing)?

--
dave

