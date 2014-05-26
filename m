From: <doiggl@velocitynet.com.au>
Subject: Re: [patch 00/29] reiserfs cleanup patchset
Date: Mon, 26 May 2014 14:12:25 +1000
Message-ID: <99312868ee739a16e4ac4c6a5b4c1ff4@mail.velocitynet.com.au>
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
> - -- 
> Jeff Mahoney

Hello Jeff,
As you mentioned that 'This patch set is against the kernel.'

Question:
Would the following method work to apply patches ? [in a Branch a copy of
Kernel:stable/kernel-vanilla -obs]

- Branch a copy of Kernel:stable/kernel-vanilla
- Add patches to patches.rpmify.tar.bz2  patches.rpmify/[patch name]
- Add these lines to series.conf example:

	########################################################
	# Reiserfs Patches
	########################################################

	patches.rpmify/01-29-use per-fs commit workqueues.patch
..
	patches.rpmify/29-29-balance_leaf refactor split up
balance_leaf_when_delete.patch


Cheers Glenn
