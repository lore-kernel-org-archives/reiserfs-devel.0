From: Adrian Phillips <a.phillips@met.no>
Subject: Re: Reiserfs with Samba vs NetApp Filer
Date: 12 Oct 2002 16:47:29 +0200
Sender: "Adrian Phillips,,," <a.phillips@met.no>
Message-ID: <877kgnlnni.fsf@freeze.oslo.dnmi.no>
References: <Pine.LNX.4.33L2.0210100853240.1670-100000@localhost.localdomain>
	<200210121052.22603.bofh@coker.com.au> <20021012150028.G14731@vestdata.no>
	<200210121600.39712.bofh@coker.com.au>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11663-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200210121600.39712.bofh@coker.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

>>>>> "Russell" == Russell Coker <bofh@coker.com.au> writes:

    Russell> Actually the problem then becomes case space.  On the
    Russell> linux IDE arrays list there are a few people having 2 or
    Russell> more 3ware cards, they have 16 or more IDE drives in a
    Russell> system.  With 24 inch cables they can get by with regular
    Russell> IDE cabling (and S-ATA will solve this properly soon).
    Russell> 3ware cards allow support for enough disks.  The problem
    Russell> then becomes what to house the disks in and how to supply
    Russell> enough power.

This may be a bit OT for this list by now. We've just had delivered a
28 disk solution (without all the disks yet but approx 5TB). There is
a cabinet which can handle 32 disks I believe but don't ask me about
power for it. We've got a 810W failover power supply with
this. Cabling is supplied by 3ware, they have up to 36", out of
spec. but of decent enough quality to work (I hope).

Anyway, there are limits to IDE til SATA turns up. My boss is looking
at a 50TB solution and (PATA) IDE currently can't handle this.

Sincerely,

Adrian Phillips

-- 
Your mouse has moved.
Windows NT must be restarted for the change to take effect.
Reboot now?  [OK]
