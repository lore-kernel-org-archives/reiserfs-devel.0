From: Philippe =?ISO-8859-15?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Subject: merge 2.4.21-pre4 with Direct IO bug fix
Date: Tue, 4 Mar 2003 01:34:50 +0100
Message-ID: <20030304013450.249cc096.philippe.gramoulle@mmania.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13055-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: Chris Mason <mason@suse.com>, reiserfs <reiserfs-list@namesys.com>


Hi Oleg,

Could you please rediff the patch for the DIRECT IO bug fix (pre5) against 2.4.21-pre4 + 
data-logging patches ? ( I've tried to merge it manually, but there are too many non trivial rejects
for me to dare feeling comfortable :o)

I'd like to give these new quota patches a try as since our kernels date back from 2.4.19-pre6
(with quota), the journal overflow bug keep hitting us more and more every day.

Thanks much,

Philippe
