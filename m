From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [patch 00/29] reiserfs cleanup patchset
Date: Mon, 26 May 2014 14:24:18 -0400
Message-ID: <538386D2.8080903@suse.com>
References: <20140423140033.704113918@suse.com> <a97220c3691f4bfc6e57283827b68524@mail.velocitynet.com.au> <535BCD38.5070607@suse.com> <cae4fb2a6e9302cd90b75a78d47ac7ef@mail.velocitynet.com.au> <c3acce54543811f458b7df2fa7122d53@mail.velocitynet.com.au> <537E00FA.8090500@suse.com> <99312868ee739a16e4ac4c6a5b4c1ff4@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <99312868ee739a16e4ac4c6a5b4c1ff4@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 5/26/14, 12:12 AM, doiggl@velocitynet.com.au wrote:
> On Thu, 22 May 2014 09:51:54 -0400, Jeff Mahoney <jeffm@suse.com>
> wrote:
>> -----BEGIN PGP SIGNED MESSAGE----- Hash: SHA1
>> 
>> On 5/22/14, 4:24 AM, doiggl@velocitynet.com.au wrote:
>>> On Fri, 16 May 2014 20:47:37 +1000,
>>> <doiggl@velocitynet.com.au> wrote:
>>>> On Sat, 26 Apr 2014 11:14:00 -0400, Jeff Mahoney
>>>> <jeffm@suse.com> wrote:
>>>>> -----BEGIN PGP SIGNED MESSAGE----- Hash: SHA1
>>>>> 
>>>>> On 4/25/14, 11:46 PM, doiggl@velocitynet.com.au wrote:
>>>>>> Hello Jeff, Could you update the source in obs as well. 
>>>>>> openSUSE Build Service > Projects > filesystems >
>>>>>> reiserfs 
>>>>>> https://build.opensuse.org/package/show/filesystems/reiserfs
>>>>>>
>>>>>>
>>>>>> 
logged https://bugzilla.novell.com/show_bug.cgi?id=875332
>>>>> 
>>>>> Hi Glenn -
>>>>> 
>>>>> This patch set is against the kernel, not reiserfsprogs.
>>>>> Also, since there's no functional changes introduced in the
>>>>> patchset (except for the workqueue changes), there's no
>>>>> sense in carrying them separately.
>>>>> 
>>>>> - -Jeff
>>>>> 
>>> Hello Jeff, Where can I find a compiled rpms with this [patch 
>>> 00/29] reiserfs cleanup patchset included ? [in 
>>> https://build.opensuse.org/]
>> 
>> Hi Glenn -
>> 
>> I haven't put together a built kernel with them and don't really
>> have the time to do so.
>> 
>> - -Jeff
>> 
>> - -- Jeff Mahoney
> 
> Hello Jeff, As you mentioned that 'This patch set is against the
> kernel.'
> 
> Question: Would the following method work to apply patches ? [in a
> Branch a copy of Kernel:stable/kernel-vanilla -obs]
> 
> - Branch a copy of Kernel:stable/kernel-vanilla - Add patches to
> patches.rpmify.tar.bz2  patches.rpmify/[patch name] - Add these
> lines to series.conf example:
> 
> ######################################################## # Reiserfs
> Patches ########################################################
> 
> patches.rpmify/01-29-use per-fs commit workqueues.patch .. 
> patches.rpmify/29-29-balance_leaf refactor split up 
> balance_leaf_when_delete.patch
> 


Yep, that should work.

- -Jeff

- -- 
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.22 (Darwin)

iQIcBAEBAgAGBQJTg4bSAAoJEB57S2MheeWyT+cP/R4JQVDmdkTjNkylTfb0mkOR
x0E55RZKTrL/+RGpDQ3Bv3U0mzZoW9oVaapv8RRndrTuOPHM/kMa+Lxsi80KHoeI
4ttLiEhryxR5xpttJfkyGL/I0AOinA2298pxymfn8pZvRJU+dLXyi9BgG9JVowRf
wK1Ji1xBPJj6YMmPe0qokt1cp5keQ6REsDOYR2BtTIpTcbz75NPTtDGCzllUZP/o
9iS/7+gX3dwFKyCQHgzoO6KX8hAaCcB/0+xEP/byRUpLSVjmToeo5d4zD36AKLPG
t/dy5vpwDUKVQsB/ogZTcoX7vIxBWINuYqpJMWYDkLDRQrSSVHbZmm5t9eemr1Ml
MxrQf7qnMNZ2ByA33g74OjEygxT6xLazm5DmzbXkxzhBXK/z70Cb1ONOA9B5qLQf
gq7AkdJ/zQTfYUtWn6UiBMjR2KzRSkw1NZn9wHXSfI+b9XIhJ4Oh7kadG5eu5mXg
2lx+ufsal61Rfse4For7TG8KE72jMFw0OG/ZVinaQauw0vOkIaK6H8e4djhD0K0H
iGGj0pqxTuQwyDFUFwEMnT2Be8jqaDA+q6bF4NPxAEq43XRnQVVuni68nV7JsqmV
z8baCA0fgWfuAD2tMF8tpnAtvh5e+vTKjwCzkMzBPOrxT0L+D+E1t0YO91kRVFWu
LlXHfndmNFuOIu/Qg43i
=ye8Q
-----END PGP SIGNATURE-----
