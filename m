From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: 01-iput-deadlock-fix & data-logging
Date: Fri, 24 Jan 2003 11:22:01 +0100
Message-ID: <3E3113C9.1060100@mb.tu-ilmenau.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12478-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list <reiserfs-list@namesys.com>
Cc: Chris Mason <mason@suse.com>, Oleg Drokin <green@namesys.com>

Hi all!

When I applied the new 01-iput-deadlock-fix from
ftp://ftp.namesys.com/pub/reiserfs-for-2.4/2.4.20-pending/01-iput-deadlock-fix.diff

on 2.4.21-pre3 -> together with Chris Masons data-logging patches <- I 
saw that the main data-logging patch didn't apply without rejects. This 
also affects 2.4.20.

Without knowing what I was doing (as ever ;-) ) I changed the related 
patch lines and now put the repacked results here for anyone interested:

for 2.4.20: 
http://manuel.krause.bei.t-online.de/downloads/2.4.20/03-data-logging-32b.diff.gz

for 2.4.21-pre(3):
http://manuel.krause.bei.t-online.de/downloads/2.4.21-pre/05-data-logging-33b.diff.gz


At first I applied the 01-iput-deadlock-fix.diff and then all the 
data-logging stuff. The kernel compiled and works for me.

I hope there is no mistake with it!


Bye,

Manuel

