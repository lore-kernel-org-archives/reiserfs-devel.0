From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [patch 00/29] reiserfs cleanup patchset
Date: Fri, 13 Jun 2014 11:09:33 -0400
Message-ID: <539B142D.5030205@suse.com>
References: <20140423140033.704113918@suse.com> <a97220c3691f4bfc6e57283827b68524@mail.velocitynet.com.au> <535BCD38.5070607@suse.com> <cae4fb2a6e9302cd90b75a78d47ac7ef@mail.velocitynet.com.au> <c3acce54543811f458b7df2fa7122d53@mail.velocitynet.com.au> <537E00FA.8090500@suse.com> <2caab58290b2fea36dc2937a1ad13025@mail.velocitynet.com.au> <5399BB6E.306@suse.com> <9c62eabf39f50a48e3362dbce9cc6f9a@mail.velocitynet.com.au> <539A7D56.10106@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <539A7D56.10106@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 6/13/14, 12:25 AM, Jeff Mahoney wrote:
> On 6/13/14, 12:20 AM, doiggl@velocitynet.com.au wrote:
> 
>>> 
>>> Glenn, for the same reason I declined to add them previously,
>>> I'm not going to add them to Factory. They'll get pulled in 
>>> automatically via the next upstream kernel update.
>>> 
>>> - -Jeff
>>> 
> 
>> Hello,
> 
>> Re:They'll get pulled in automatically via the next upstream 
>> kernel update.
> 
>> Question: So will the patches come down with say 
>> kernel-vanilla-3.15.0x Example: Kernel:stable > kernel-vanilla > 
>> Build Log
> 
>> [  433s] build: extracting built packages... [  465s] 
>> RPMS/x86_64/kernel-vanilla-3.15.0-1.1.g9194b64.x86_64.rpm [
>> 465s] 
>> RPMS/x86_64/kernel-vanilla-devel-3.15.0-1.1.g9194b64.x86_64.rpm
>> [ 465s] SRPMS/pesign-repackage-1.0-1.1.src.rpm [  465s] 
>> SRPMS/kernel-vanilla-3.15.0-1.1.g9194b64.nosrc.rpm
> 
> 
>> Cheers Glenn
> 
>> I see in factory 
>> http://ftp5.gwdg.de/pub/opensuse/factory/repo/oss/suse/x86_64/kernel-desktop-3.15.rc7-1.2.x86_64.rpm
>
>> 
> 
> No, it'll be 3.16 at least.

The patchset landed in 3.16-rc1.

- -Jeff

- -- 
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.19 (Darwin)

iQIcBAEBAgAGBQJTmxQtAAoJEB57S2MheeWyHnYQAMG/hy5QF4vuvyBMrlaswIvi
4CPPGWumaRcxHqO4MDDs0LJCP/JbcBupzBkBo3wFF/AU6gqDXkDCV23rfZ7fv+iz
bazdiPqjpinTBnRm8AdiaQ4cRfejVPwjYufconoez/wI8YOflEPywE14iMrTZ0aL
cIL9i/AkoIbZXY8gXVZ+r567w6TRpPIrIiEeZz1gb+lzqce5jRPkl5BD6oo5TdPi
7eJrG9pdgjZ0+yTykdnR6KIzSD7o99oG6vWcP6P1XAFCcJdBh93jq5S4PqRWS7Vq
JgjezpQl+rkBb+9WwBzho1BayYsIdu6OE7xtWJ5GBGL7goa9XPE8sh9Vl9vqPmgp
qQFKTxzbTTq29HX7oJ+uqxqHEcYaju5xEw4cS94M1GV+GKZ+gEhDntepc4ahfHET
PtnJtx6lE4JqQROyw9KVxmdR1uWTzsNhfaQIHQfuas4s4vhGgsvxg4Gjl1BJ1S/L
87VjexdasV+NQbxP6orPvwW6arAAQCLRxdlZfmJvSUf1QXe6+pwDS1GwZNWfNfe3
UU/jRbOkKX1jNKhclS9Sa+NOq+QguMRehuzBtCCNCmlhcPXnQEG0O0U6xZbfvg4H
VCQMnGvC4/2UgF8VhjifwJjJVf3jVgltp1fJyMHy+YoQgfoPYpFqu8K9nbpuwtcB
M4YjXHdtgbvXam8GWkdF
=n3g4
-----END PGP SIGNATURE-----
