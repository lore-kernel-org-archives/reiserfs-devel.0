From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Collect data?
Date: Wed, 23 Nov 2005 14:22:18 +0300
Message-ID: <438450EA.5050409@namesys.com>
References: <200511171447.41362.mail@earthworm.de> <4383677F.8060106@namesys.com> <20051123070924.GA6951@favonius> <200511231126.43754.mail@earthworm.de> <20051123104847.GA22178@favonius>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27104-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20051123104847.GA22178@favonius>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: sander@humilis.net
Cc: "Hesse, Christian" <mail@earthworm.de>, reiserfs-list@namesys.com, "E.Gryaznova" <grev@namesys.com>

Hello

Sander wrote:
> Hesse, Christian wrote (ao):
>>On Wednesday 23 November 2005 08:09, Sander wrote:
>>>My 'good' system:
>>>kernel:		2.6.15-rc1-mm2
>>>OS:		Debian Sid
>>>disks:		4x sata on Promise
>>>raid/lvm/etc:	lmv stripe
>>>
>>>My 'bad' system:
>>>kernel:		2.6.15-rc1-mm1
>>>OS:		Debian Sid
>>>disks:		ata on nForce2
>>>raid/lvm/etc:	none, single disk
>>My 'bad' system:
>>kernel:		everything from 2.6.14-rc3* to 2.6.15-rc1*
>>Compiler:		GCC 3.4.4-r1 (including Gentoo patches)
>>OS:			Gentoo ~x86
>>disk:			ATA on Intel ICH4-M (Centrino Notebook)
>>raid/lvm/etc:	none, single disk
> 
> Your Compiler suggestion is a good one.
> 
> I added your data at http://humilis.net/reiser4slowdown assuming you
> don't mind (please let me know if you do mind).
> 
> Reiser-dev team, do you need other info beside what is listed there?
> 

It could be useful if there were a description of a test which was used to
measure slowdown, result of that test on both "good" and "bad" kernels.
Information about good kernel is also needed.
