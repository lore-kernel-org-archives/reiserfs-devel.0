From: Wolfgang Rohdewald <wolfgang@rohdewald.de>
Subject: Re: file attributes destroyed.
Date: Mon, 27 Oct 2003 05:54:44 +0100
Message-ID: <200310270554.45011.wolfgang@rohdewald.de>
References: <200310261227.18711.wolfgang@rohdewald.de> <200310261550.06162.vitaly@namesys.com>
Reply-To: wolfgang@rohdewald.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15891-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200310261550.06162.vitaly@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On 26.10.2003 13:50, Vitaly Fertman wrote:
VF> would you take the latest reiserfsprogs from our ftp site (3.6.11) and run
VF> reiserfsck to be sure that there are no fs corruptions.
VF>

I now did. Actually I downloaded the latest Knoppix which contains reiserfsck 3.6.11.
Result: Nothing found.

I guess I'll just wait and see if it happens again.
Thank you very much for your help anyway.

reiserfsck --check started at Mon Oct 27 05:27:28 2003
###########
Replaying journal..
0 transactions replayed
Checking internal tree..finished
Comparing bitmaps..finished
Checking Semantic tree:
finished
No corruptions found
There are on the filesystem:
        Leaves 132833
        Internal nodes 893
        Directories 30379
        Other files 461546
        Data block pointers 17680796 (932 of them are zero)
        Safe links 0
###########
reiserfsck finished at Mon Oct 27 05:44:58 2003
###########


-- 
Wolfgang
