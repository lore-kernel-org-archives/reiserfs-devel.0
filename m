From: Vince <fuzzy77@free.fr>
Subject: status of grub reiser4 support ?
Date: Mon, 15 Mar 2004 12:47:02 +0100
Message-ID: <405597B6.1000906@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17217-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com
Cc: bug-grub@gnu.org

Hi,

  I'd like to know the current status of bootloaders support for 
reiser4. The latest patch for grub I could find is this one:
http://www.namesys.com/snapshots/2003.06.06/grub-0.93-reiser4-20030606.diff

I've tried to apply it to the current grub sources from debian/unstable 
and made a few modifications to make it compile and link with the 
current libaal and libreiser4 but in the end I couldn't make it work... 
Is there a more up to date patch for grub available ?
