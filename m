From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Formating Reiserfs 3.6 with bad-blocks
Date: Thu, 31 Jul 2014 11:25:41 -0400
Message-ID: <53DA5FF5.5040706@suse.com>
References: <CAMRsyOc5b+CejzE4R2Oz7367+N=v6dGR4P2eoVph=E=A9gMJYg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <CAMRsyOc5b+CejzE4R2Oz7367+N=v6dGR4P2eoVph=E=A9gMJYg@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bhikkhu Mettavihari <tv.lists@gmail.com>, Linux Reiserfs Devel <reiserfs-devel@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 7/26/14, 4:16 AM, Bhikkhu Mettavihari wrote:
> Greetings,
> 
> I have about 50 x 500GB to 2 TB hard disks in my setup. All them
> are using reiserfs 3.6
> 
> When I get slow reads on a hard disk then I do: # badblocks -b 4096
> -o bad-blocks-finished-6-2.txt /dev/sdd1
> 
> # tail -f bad-blocks-finished-6-2.txt 77299721 77299722
> 
> after that I format the hard disk with this command:
> 
> mkfs.reiserfs -B /root/bad-blocks-finished-6-2.txt /dev/sdd1
> 
> But my hard disk still seems to have problems with reading certain
> parts. I notice that the reading speed is going down to a very low
> level with some files.
> 
> Is my method correct ? or have I done something incorrect ?

I hate to be the bearer of bad news, but whatever disk is reporting
the bad blocks probably needs to be replaced. Modern disks have the
ability to remap sectors automatically. If you are getting bad sectors
during writes, it means that the remapping table has been exhausted.
If you're getting bad sectors during reads, your best bet is to try to
copy those blocks elsewhere and hope for the best.

- -Jeff

- -- 
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.19 (Darwin)

iQIcBAEBAgAGBQJT2l/1AAoJEB57S2MheeWyt80QAKqaMGAS8rsWOeSi4fN0rRdR
/pKoPOEIub/lIwVxct6wGyut5+D+11ihLDUTnZnskImq3l+uEZQuOXTzY57CbTeW
34W8e5hZoUTb4fNXONYyIPrq6RsiLC82Hixkbt90A7V9r/zpyu0uMwqwHqtjfP3l
QQw+IoucdxXdKn0d0udNfWZF9UbV9lNYQtBDCtz/7YGwf249al3dJfzuI0fx9gJ6
0OSZboMeVYfzJ53bmi8NDMVACz75y9E8x5DJX40NgBZNB9TpahCK0ttCSJ3n5v8D
CvEAGeUEThoJtMVcT93zRzLAky8AHOTQVS+OLNdbHm8eGKYULlbyJdNDFVo6q0/r
QM1wFPolnZCOOKnRW9JciG/ZJl1KRK38U1ad+e42PblDZs/hZU3mixhT/zgf4gWd
d2oG3AoDlSm2gxORq5Nf8Af9kxbSi55Rx/LuDB+DrW83nKlk6fbAM+zA2cBDbZjN
84wh9xLmBWjsUkSPXcSvhWUjI5saBoxBXG7VO6lO6dOAkpP/QMwi2dgcuzEpuheS
GINBUwGiPx1PLuwKXEZ3ho7cAarLbJ7j/u5YZdZ4MGeUGzkDsHsYQTN2epSe8RB8
cDJdTForsiWlxegiJV/1CPkFQkZONomEW5xqjjByCtNG4eKX5EEp8c7VLDu1n/FV
n5h2M9zt4EmW705M9nPf
=iHxa
-----END PGP SIGNATURE-----
