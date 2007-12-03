From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [PATCH 2/2] reiserfs: Add mount counting
Date: Mon, 03 Dec 2007 16:32:21 -0500
Message-ID: <475475E5.1010400@suse.com>
References: <474B4BCF.1000905@suse.com> <47545D0D.6080608@suse.com>	 <5c7c368b0712031236i33abc7bdtd7a14354c67169b3@mail.gmail.com>	 <475469B8.4050004@suse.com> <5c7c368b0712031251w75febd3bve5aee70c4935a7c9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <5c7c368b0712031251w75febd3bve5aee70c4935a7c9@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Edward Shishkin wrote:
> On 12/3/07, Jeff Mahoney <jeffm@suse.com> wrote:
> Edward Shishkin wrote:
>>>> Hi Jeff.
>>>>
>>>> Personally, I don't object.
>>>> What does official reservation mean?
>>>> I can send a request to Hans, but I guess
>>>> we'll receive his "yes" or "no" with substantial delay..
> I just mean that those 12 bytes in the superblock are guaranteed not to
> be used for something else. Given the pace of reiserfs development, I
> don't expect this to be a problem as there are 76 more of them. :)
> 
>> Well, I promise to not use them for something else ;)

Great. That's the assurance I was looking for. :)

>> It seems we need something like reiserfsprogs-3.6.20?

I actually posted a patch against reiserfsprogs-3.6.20 that reserves the
same fields. It also implements the use of those fields. I have an
updated version that treats timestamps in the future as suspect and
forces a check. I'll post the update later today.

If there's interest in releasing a reiserfsprogs 3.6.21, I have some
patches that we've maintaining locally for a while I'd like to submit
for inclusion. Also, I don't think the code base would hurt from a
whitespace removal run. :)

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.4-svn0 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFHVHXkLPWxlyuTD7IRAhM1AJ9vBrHDW3uhRb15HnO6BNpQGOdIiwCfUHyL
aUwybiy8ZfuOwg0lXZ+xEKE=
=DpoT
-----END PGP SIGNATURE-----
