From: Bryan Henderson <hbryan@us.ibm.com>
Subject: RE: [benchmark] seek optimization
Date: Wed, 14 Jul 2004 09:46:52 -0700
Message-ID: <OFD5BA136D.E0EDCDF2-ON85256ED1.005BD676-88256ED1.005C2660@us.ibm.com>
References: <200407141633.i6EGXW317797@watkins-home.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19616-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200407141633.i6EGXW317797@watkins-home.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guy <bugzilla@watkins-home.com>
Cc: linux-fsdevel@vger.kernel.org, 'Marcel Hilzinger' <mhilzinger@linuxnewmedia.de>, 'Per Olofsson' <pelle@dsv.su.se>, reiserfs-list@namesys.com, 'Szakacsits Szabolcs' <szaka@sienet.hu>

>Consider having the 2 partitions on 2 different disks!

It would also be nice to have no destination disk at all, to isolate the 
effects of seek optimization in the source filesystem.

