From: Gorazd Golob <gorazdg@noviforum.si>
Subject: Re: md raid 1 & reiser4
Date: Thu, 20 Jan 2005 09:08:32 +0100 (CET)
Message-ID: <Pine.LNX.4.58.0501200905210.17233@datsun.noviforum.si>
References: <Pine.LNX.4.58.0501200822270.17233@datsun.noviforum.si>
 <87pt00bku0.fsf@barad-dur.crans.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23176-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <87pt00bku0.fsf@barad-dur.crans.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mathieu Segaud <Mathieu.Segaud@crans.org>
Cc: reiserfs-list@namesys.com

>
> which kernel do you run ?
> one of the last -mm kernels has serious issues concerning raid, not
> Reiser4 specific. Can you try to reproduce the problem with another
> filesystem type ?

vanilla 2.6.10 - Ok - looks like this is really md issue - ext3 is more
"resistant" to it - but there are also lock problems with unmounting md
drive independent from filesystem.
Sorry for alarm ;(

gorazd
