From: Roland Paterson-Jones <roland@rolandpj.com>
Subject: File-level copy-on-write?
Date: Fri, 11 Feb 2005 10:18:23 +0200
Message-ID: <420C6A4F.2060905@rolandpj.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23379-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi

I have an application where I want to make relatively frequent copies of 
a large file, and the copies will remain largely similar to the original.

It seems to me that a file-level copy-on-write would support this well.

So, does reiserfs support anything like this?

If not, can I implement this easily (how easily ;) ) with a plugin.

Any ideas and pointers greatfully received
Thanks
Roland

