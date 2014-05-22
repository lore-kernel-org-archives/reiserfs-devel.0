From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [patch 00/29] reiserfs cleanup patchset
Date: Thu, 22 May 2014 09:51:54 -0400
Message-ID: <537E00FA.8090500@suse.com>
References: <20140423140033.704113918@suse.com> <a97220c3691f4bfc6e57283827b68524@mail.velocitynet.com.au> <535BCD38.5070607@suse.com> <cae4fb2a6e9302cd90b75a78d47ac7ef@mail.velocitynet.com.au> <c3acce54543811f458b7df2fa7122d53@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <c3acce54543811f458b7df2fa7122d53@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 5/22/14, 4:24 AM, doiggl@velocitynet.com.au wrote:
> On Fri, 16 May 2014 20:47:37 +1000, <doiggl@velocitynet.com.au>
> wrote:
>> On Sat, 26 Apr 2014 11:14:00 -0400, Jeff Mahoney <jeffm@suse.com>
>> wrote:
>>> -----BEGIN PGP SIGNED MESSAGE----- Hash: SHA1
>>> 
>>> On 4/25/14, 11:46 PM, doiggl@velocitynet.com.au wrote:
>>>> Hello Jeff, Could you update the source in obs as well.
>>>> openSUSE Build Service > Projects > filesystems > reiserfs 
>>>> https://build.opensuse.org/package/show/filesystems/reiserfs
>>>> 
>>>> logged https://bugzilla.novell.com/show_bug.cgi?id=875332
>>> 
>>> Hi Glenn -
>>> 
>>> This patch set is against the kernel, not reiserfsprogs. Also,
>>> since there's no functional changes introduced in the patchset
>>> (except for the workqueue changes), there's no sense in
>>> carrying them separately.
>>> 
>>> - -Jeff
>>> 
> Hello Jeff, Where can I find a compiled rpms with this [patch
> 00/29] reiserfs cleanup patchset included ? [in
> https://build.opensuse.org/]

Hi Glenn -

I haven't put together a built kernel with them and don't really have
the time to do so.

- -Jeff

- -- 
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.22 (Darwin)

iQIcBAEBAgAGBQJTfgD6AAoJEB57S2MheeWyIjwP/jQGrnjpbTqOr7gRRa41n2fw
VkHc82sOx0C8+Q7BDeY+0v9BLiw5aCcmJKZFQrUZSGKx2fLB8Jmo0ZO1I7WpZP9F
TH/vDgEdzqVENrQuZAVqQXiisNK7qjIMg2IhM+Hn0zYiFW5J0G0gsjgYvYEAlJAo
TFqMJWywI+QW7ODwuljin4BDpkhkWmT707lIZFGOGba/MYYdprF5YvfW/RiZ7ruV
tPBGlfcQQlCK6IuEeyUXd8AoxS3uFonwBWQgcSm+JBPZY2ekwQxCCY7vznoOunG5
vrdfestyEZxoBzhHUpe1ynjMcy7SexA0U7VTBeLXcqouT5s1aS9Vfr6Kqj892IZM
d8cFhvlHO3Gkm10qBxOsFSjH9AHG238LijMANbU5Tur5ECJ0BjEu9GCNWEVBi9TW
oZUHWlRlq95JS8cP+sF1pi/sBbCM7wCa5OTEmHDadEVFCLGYCmojLiC9mKm33M+Z
wHFFZEVqnomhhlexL2Ohtc0NXQUWnXEATiWTboWrWRSkVCSJlwLtVSRMTfUNUlPr
ZmaTTvX+0LdsIHQVhZQS6uUYDfuDMCCExWuV/mCI3CGqxsjYMVYQWUj/WJgUWTQl
BNwWXdPcg7SIAMDTD1hG+TyTx5BnA8GxDYcxyZiyPDmcGkKhqjh4jV3H/FsDccGO
OxSlldQkv2j9HMxpXdVl
=kZaq
-----END PGP SIGNATURE-----
