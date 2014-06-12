From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [patch 00/29] reiserfs cleanup patchset
Date: Thu, 12 Jun 2014 10:38:38 -0400
Message-ID: <5399BB6E.306@suse.com>
References: <20140423140033.704113918@suse.com> <a97220c3691f4bfc6e57283827b68524@mail.velocitynet.com.au> <535BCD38.5070607@suse.com> <cae4fb2a6e9302cd90b75a78d47ac7ef@mail.velocitynet.com.au> <c3acce54543811f458b7df2fa7122d53@mail.velocitynet.com.au> <537E00FA.8090500@suse.com> <2caab58290b2fea36dc2937a1ad13025@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <2caab58290b2fea36dc2937a1ad13025@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 6/12/14, 10:31 AM, doiggl@velocitynet.com.au wrote:
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
> Hello Jeff, Just to let you know I raised this service request. 
> https://bugzilla.novell.com/show_bug.cgi?id=882480
> 
> The patches 01-29 are included in the attachment 
> [patches.rpmify.tar.bz2]to the request. Hope it shortens the time
> frame a little and is of use.

Glenn, for the same reason I declined to add them previously, I'm not
going to add them to Factory. They'll get pulled in automatically via
the next upstream kernel update.

- -Jeff


- -- 
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.19 (Darwin)

iQIcBAEBAgAGBQJTmbtuAAoJEB57S2MheeWynOEQAKVBOn9RzXcXhSqe7oLdz/EU
Ck7veSqnAZTZt4z3rOBQqrylS2Q4B1y93Hw5Iwmg89NWp/7oVQ7EPg/tmpiYlH92
p4LzaaOwO/jb/e4Xd7cGrsbTFmXEm2Kj6ZNARYpC9fPr+/lMr8jWqEzMaE9M21io
mNdoGxrEyDegHoktDo5BkY8tTLXK/OI8bFsZVlP9gmvXZc+AMDJnVMDUMYTW48rb
ms8AiMoCFJ3Sdlec7fz4Z46kXN+Fk0fpeCidM/UjD0mA7+A6FEPhmVDwPVqhLdQY
rYiN+HbzKR+Atm63oT2X1FLPcE66NgQkOw6/hmm1qPPLxbqekuIveYMClan8QBZF
C4MHYT4OulDIvZBLGDUQA+EtluF7Po9IDivjHjt+0WNge5+dvmhAVmxEXXTAjXwk
kehkCIQYDeTsVoRV5hQUvHhAuLrnjTAIJOi97CUZ1ZO3LOQyr42Qe+oha6zIHHqV
lWXzk6vQX9u1EYB9OGLIqgARJXpfNV7/I1LN++a0Tg4wDBOqbk5ia4BGW0wN0f+S
ld5vWJ8fu4kLo2sgOVcOurbqQbKDPN/ymi2zMWtw9NJLqRFCYIxBDmmL70W7b+Zc
/RYnD2zQzrUn2JntNIy10hwRUAS7UtbL+kalrmry1dGRUdiuZtayP7QJZ5U9OaTP
VXxmAxEb93Ql63WOaG9a
=DS+w
-----END PGP SIGNATURE-----
