From: Jure Pecar <pegasus@nerv.eu.org>
Subject: reiserfs on redhat advanced server?
Date: Thu, 30 Jan 2003 17:35:22 +0100
Message-ID: <20030130173522.3aa4d0e1.pegasus@nerv.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12561-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi all,

does anyone have some expirience with the reiserfs provided in redhat's
2.4.9-e.3 kernel from its Advanced Server?

Judging by the version number and the general lack of interest for
reiserfs redhat shows, it is not that well supported.
/proc/fs/reiserfs/version says it's a 3.6.25 and reiserfs-utils are
3.x.0j-3.

Now, what are the known issues with these versions? Anything critical? 
I would like to stay with that well tested kernel, if this version of
reiserfs wont eat my data (or cause other great pain).

This box (a pair of them, actually) will be used as a HA cyrus mailstore.
Both are connected to the same disks via fibrechannel. For a start they'll
serve 200k users from a 500gb raid10.

Thanks for suggestions,

--

Jure Pecar
