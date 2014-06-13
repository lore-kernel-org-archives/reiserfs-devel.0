From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [patch 00/29] reiserfs cleanup patchset
Date: Fri, 13 Jun 2014 00:25:58 -0400
Message-ID: <539A7D56.10106@suse.com>
References: <20140423140033.704113918@suse.com> <a97220c3691f4bfc6e57283827b68524@mail.velocitynet.com.au> <535BCD38.5070607@suse.com> <cae4fb2a6e9302cd90b75a78d47ac7ef@mail.velocitynet.com.au> <c3acce54543811f458b7df2fa7122d53@mail.velocitynet.com.au> <537E00FA.8090500@suse.com> <2caab58290b2fea36dc2937a1ad13025@mail.velocitynet.com.au> <5399BB6E.306@suse.com> <9c62eabf39f50a48e3362dbce9cc6f9a@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <9c62eabf39f50a48e3362dbce9cc6f9a@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 6/13/14, 12:20 AM, doiggl@velocitynet.com.au wrote:
> 
>> 
>> Glenn, for the same reason I declined to add them previously, I'm
>> not going to add them to Factory. They'll get pulled in
>> automatically via the next upstream kernel update.
>> 
>> - -Jeff
>> 
> 
> Hello,
> 
> Re:They'll get pulled in automatically via the next upstream
> kernel update.
> 
> Question: So will the patches come down with say
> kernel-vanilla-3.15.0x Example: Kernel:stable > kernel-vanilla >
> Build Log
> 
> [  433s] build: extracting built packages... [  465s]
> RPMS/x86_64/kernel-vanilla-3.15.0-1.1.g9194b64.x86_64.rpm [  465s]
> RPMS/x86_64/kernel-vanilla-devel-3.15.0-1.1.g9194b64.x86_64.rpm [
> 465s] SRPMS/pesign-repackage-1.0-1.1.src.rpm [  465s]
> SRPMS/kernel-vanilla-3.15.0-1.1.g9194b64.nosrc.rpm
> 
> 
> Cheers Glenn
> 
> I see in factory 
> http://ftp5.gwdg.de/pub/opensuse/factory/repo/oss/suse/x86_64/kernel-desktop-3.15.rc7-1.2.x86_64.rpm
>
> 
No, it'll be 3.16 at least.

- -Jeff

- -- 
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.22 (Darwin)

iQIcBAEBAgAGBQJTmn1WAAoJEB57S2MheeWyRL8P/3Rt8rK7tYFDfLlyPXQQchD/
Ur1zBlgX8zlQS8Qu1cTyMeHyHeuXBtHUJC1xzturnPu0EHvOMLgNxlEPdsSmY2Jw
QqvRud2JV5WErEHRhtOdB9ZAOWq/Tqsm5RvybivonB0oWa0LyYeUoiM3sM3Z9Mqu
JWlGDNOqTHGdHmDAFSRhU/HlT9wGaq6MOMS9433TtIK1q2Krag9jatTkeChT02lO
pUYjYPVSSGPCBy6dt0TOreKApR5LXcUqzQYJ4yKqlcPGzE0CgJLvzqP9YV8AHpFW
Vgn7vJ5DG+QTWce2D/02m+ZPVyxY5mVn3dDQbXra4JBP0hUpevnjD5APWdwX6F+9
GoGcIzlnDXe9EJXdvn/ao+bfD5d5mzKLvBrnLOHBliwUUZHI2nYsOMgDSALRxS+S
E2hNC9XSd5u7Y7sX/9qH5lBC9LiI3zTKJfeKgPDTP/tJKHP7RLE5hW3QE2uzW0QA
vkbyM8jxOUzU9lnqCyWvdfqX+xqiyo4+9uJ7NeJHtyZQHey3HRFLQCTGbBUtQqBz
xRdEwWgMv4JkdIY/53WdpO0JPgrYZOGyXiZ1fStCyE4jeVp9t+D0KGTVur7cfM3l
s9yMg2Gqac0JUOjbIOIVgpNZBb2/vH22l2MZCHT+FHWHfASsuuE2/AtuNeDC3q3u
bEBUDfdMwgqliu+elrab
=9k6s
-----END PGP SIGNATURE-----
