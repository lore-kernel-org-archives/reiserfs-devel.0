From: "Jaroslav Fojtik" <jafojtik@seznam.cz>
Subject: Re12: Reiserfs3 is crashing - where/whom to report?
Date: Tue, 27 Jan 2009 22:30:01 +0100
Message-ID: <497F7CD9.12840.BBFD00@jafojtik.seznam.cz>
References: <49750FC1.23700.2C929@JaFojtik.seznam.cz>, <497778C6.8346.108280@JaFojtik.seznam.cz>, <497776A4.8000002@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-reply-to: <497776A4.8000002@suse.com>
Content-description: Mail message body
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>, Edward Shishkin <edward.shishkin@gmail.com>, Reiserfs mailing list <reiserfs-devel@vger.kernel.org>

Dear Jeff,

> Well then I have good news for you. That graph is for fat32, which is
> really really dumb in the way it does allocations. Reiserfs does "tail
> packing," which allows us to pack data in with metadata, eliminating
> most of the waste that you're afraid of. In fact, by choosing a smaller
> block size, you actually waste *more* space since more metadata is
> needed to describe it, and each of those metadata blocks needs a portion
> of it for headers, etc.

Thank you very much for your promising info.

I have tested full reiserfs file check and 640GB has been checked in 20mins
and this check is not necessary. It is a good job in comparison with ext2 where 
20GB check spends 2 hours.

But I still believe that there must be some dependency between allocation 
units and wasted space. I guess that one allocation unit could accommodate one 
short file but looking here:
  http://homes.cerias.purdue.edu/~florian/reiser/reiserfs.php
it does not neccesary to be a case.


thanks for explanation
   Jara


> 
> - -Jeff
> 
> - --
> Jeff Mahoney
> SUSE Labs
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v2.0.9 (GNU/Linux)
> Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org
> 
> iEYEARECAAYFAkl3dqQACgkQLPWxlyuTD7KOdwCgoPs3UxgdETHZ5p4D/czIqV1I
> Jr4AoIA6QFySoLr5OaRsHawTbTD4GDzd
> =HRr2
> -----END PGP SIGNATURE-----


