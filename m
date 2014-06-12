From: <doiggl@velocitynet.com.au>
Subject: Re: [patch 00/29] reiserfs cleanup patchset
Date: Fri, 13 Jun 2014 00:31:42 +1000
Message-ID: <2caab58290b2fea36dc2937a1ad13025@mail.velocitynet.com.au>
References: <20140423140033.704113918@suse.com> <a97220c3691f4bfc6e57283827b68524@mail.velocitynet.com.au> <535BCD38.5070607@suse.com> <cae4fb2a6e9302cd90b75a78d47ac7ef@mail.velocitynet.com.au> <c3acce54543811f458b7df2fa7122d53@mail.velocitynet.com.au> <537E00FA.8090500@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <537E00FA.8090500@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: reiserfs-devel@vger.kernel.org

On Thu, 22 May 2014 09:51:54 -0400, Jeff Mahoney <jeffm@suse.com> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 5/22/14, 4:24 AM, doiggl@velocitynet.com.au wrote:
>> On Fri, 16 May 2014 20:47:37 +1000, <doiggl@velocitynet.com.au>
>> wrote:
>>> On Sat, 26 Apr 2014 11:14:00 -0400, Jeff Mahoney <jeffm@suse.com>
>>> wrote:
>>>> -----BEGIN PGP SIGNED MESSAGE----- Hash: SHA1
>>>> 
>>>> On 4/25/14, 11:46 PM, doiggl@velocitynet.com.au wrote:
>>>>> Hello Jeff, Could you update the source in obs as well.
>>>>> openSUSE Build Service > Projects > filesystems > reiserfs 
>>>>> https://build.opensuse.org/package/show/filesystems/reiserfs
>>>>> 
>>>>> logged https://bugzilla.novell.com/show_bug.cgi?id=875332
>>>> 
>>>> Hi Glenn -
>>>> 
>>>> This patch set is against the kernel, not reiserfsprogs. Also,
>>>> since there's no functional changes introduced in the patchset
>>>> (except for the workqueue changes), there's no sense in
>>>> carrying them separately.
>>>> 
>>>> - -Jeff
>>>> 
>> Hello Jeff, Where can I find a compiled rpms with this [patch
>> 00/29] reiserfs cleanup patchset included ? [in
>> https://build.opensuse.org/]
> 
> Hi Glenn -
> 
> I haven't put together a built kernel with them and don't really have
> the time to do so.
> 
> - -Jeff
> 
Hello Jeff,
Just to let you know I raised this service request.
https://bugzilla.novell.com/show_bug.cgi?id=882480

The patches 01-29 are included in the attachment
[patches.rpmify.tar.bz2]to the request.
Hope it shortens the time frame a little and is of use.

Cheers Glenn
--Glenn
