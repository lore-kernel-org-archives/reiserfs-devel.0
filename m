From: "Jason Zebchuk" <jason@consensys.com>
Subject: quotas in 2.4.20
Date: Mon, 2 Dec 2002 18:12:25 -0500
Message-ID: <01ca01c29a58$4784a4b0$4902a8c0@consensys.com>
Reply-To: <jason@consensys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12086-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

I was trying to apply the reiserfs-quota-22 patch to a 2.4.20 kernel and it
didn't work.  I tried to find out why failed, and to see if I could fix the
problem, but it seems that significant changes were made to the file
bitmap.c .  I couldn't even find some of the functions that were being
patched.

Does the 2.4.20 kernel require this patch, or a similar one to work with
quota's?  Will such a patch me made?



Thanks


Jason Zebchuk

