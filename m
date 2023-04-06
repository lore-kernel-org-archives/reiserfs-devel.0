From: Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: [PATCH v10 2/4] security: Allow all LSMs to provide xattrs for
 inode_init_security hook
Date: Thu, 6 Apr 2023 09:17:05 -0700
Message-ID: <733a7896-0b0e-f86f-0068-0285d646d563@schaufler-ca.com>
References: <20230331123221.3273328-1-roberto.sassu@huaweicloud.com>
 <20230331123221.3273328-3-roberto.sassu@huaweicloud.com>
 <CAHC9VhSbGdij6xz9D49my37kD9qYrBmh2x7=cNFFDL2dZ=EZTw@mail.gmail.com>
 <5dbb9430-1e26-ec12-26a2-3718c84e33c2@schaufler-ca.com>
 <7549b624-421e-30b9-ca99-de42929354c7@huaweicloud.com>
 <CAHC9VhTsSUM6_g5+ZOqZ=P6307hCAJW+-xEc4fKQcymPs5pYjQ@mail.gmail.com>
 <83ddfcb9-b4a6-71b4-a20c-62f484c8e040@schaufler-ca.com>
 <CAHC9VhTO02CGUt0DUUmx=TUYS7Q81fas_Qy5miOFonaye0NEmw@mail.gmail.com>
 <c3751b2b-aa4b-2105-c238-29816bc85607@schaufler-ca.com>
 <841747d7-ab17-2904-ea1d-6adb3d35c711@huaweicloud.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1680797835; bh=VuSERGq4d+Cfe8sCq/lVtoww/oUbwbdKqqQ64i5D7LE=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=CsZM3TfsFQb7BNQgiB/R9kYXLI4Q2KKUe9O9pONITa1Dx+4yOTGTRTKpQ446oHSdudyl0+JADNfEqGgygI9f2Pm34+rCj2P+WjSIVpf2mVoy4z0L4yAgmJazkEmQXyBK5ftOECMulXkgn68LXi0pMiJAiMidP9hz3z+S39wbNliwxB3nN/OGViHW/D3C8U7dTQySEP1QB0ikfvsYBbr0kQ2hFjLjYmEn27YL8OcKXlQfw93drrHiXkrQ2KYMSFU3IQDYMTnJRpvDB/by4+0quD9/FZQzBpclu4WcnavOD1XptAMxhJVsXeu6RrtvH5+ziDnJ9KdXG3qxxqZqc02cJA==
Content-Language: en-US
In-Reply-To: <841747d7-ab17-2904-ea1d-6adb3d35c711@huaweicloud.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Roberto Sassu <roberto.sassu@huaweicloud.com>, Paul Moore <paul@paul-moore.com>
Cc: zohar@linux.ibm.com, dmitry.kasatkin@gmail.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, bpf@vger.kernel.org, kpsingh@kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>, Casey Schaufler <casey@schaufler-ca.com>

On 4/6/2023 2:14 AM, Roberto Sassu wrote:
> On 4/5/2023 11:07 PM, Casey Schaufler wrote:
>> On 4/5/2023 1:49 PM, Paul Moore wrote:
>>> On Wed, Apr 5, 2023 at 4:43 PM Casey Schaufler
>>> <casey@schaufler-ca.com> wrote:
>>>> On 4/5/2023 12:59 PM, Paul Moore wrote:
>>>>> On Wed, Apr 5, 2023 at 5:44 AM Roberto Sassu
>>>>> <roberto.sassu@huaweicloud.com> wrote:
>>>>>> On 4/5/2023 4:08 AM, Casey Schaufler wrote:
>>>>>>> On 4/4/2023 11:54 AM, Paul Moore wrote:
>>>>>>>> On Fri, Mar 31, 2023 at 8:33 AM Roberto Sassu
>>>>>>>> <roberto.sassu@huaweicloud.com> wrote:
>>>>> ..
>>>>>
>>>>>>>>> diff --git a/security/smack/smack_lsm.c
>>>>>>>>> b/security/smack/smack_lsm.c
>>>>>>>>> index cfcbb748da2..8392983334b 100644
>>>>>>>>> --- a/security/smack/smack_lsm.c
>>>>>>>>> +++ b/security/smack/smack_lsm.c
>>>>>>>>> @@ -52,6 +52,15 @@
>>>>>>>>>    #define SMK_RECEIVING  1
>>>>>>>>>    #define SMK_SENDING    2
>>>>>>>>>
>>>>>>>>> +/*
>>>>>>>>> + * Smack uses multiple xattrs.
>>>>>>>>> + * SMACK64 - for access control, SMACK64EXEC - label for the
>>>>>>>>> program,
>>>>>>>> I think it would be good to move SMACK64EXEC to its own line;
>>>>>>>> it took
>>>>>>>> me a minute to figure out why SMACK_INODE_INIT_XATTRS was set
>>>>>>>> to '4'
>>>>>>>> when I only say three comment lines ... ;)
>>>>>>>>
>>>>>>>>> + * SMACK64MMAP - controls library loading,
>>>>>>>>> + * SMACK64TRANSMUTE - label initialization,
>>>>>>>>> + * Not saved on files - SMACK64IPIN and SMACK64IPOUT
>>>>>>>>> + */
>>>>>>>>> +#define SMACK_INODE_INIT_XATTRS 4
>>>>>>>> If smack_inode_init_security() only ever populates a single
>>>>>>>> xattr, and
>>>>>>>> that is the only current user of SMACK_INODE_INIT_XATTRS, can
>>>>>>>> we make
>>>>>>>> this '1' and shrink the xattr allocation a bit?
>>>>>>> If the parent directory is marked with SMACK64_TRANSMUTE, the
>>>>>>> access
>>>>>>> rule allowing the access has the "t" mode, and the object being
>>>>>>> initialized
>>>>>>> is a directory, the new inode should get the SMACK64_TRANSMUTE
>>>>>>> attribute.
>>>>>>> The callers of security_inode_init_security() don't seem to care.
>>>>>>> I can't say if the evm code is getting SMACK64_TRANSMUTE or, for
>>>>>>> that
>>>>>>> matter, SMACK64_EXEC and SMACK64_MMAP, some other way. The older
>>>>>>> system
>>>>>>> allowed for multiple Smack xattrs, but I'm not clear on exactly
>>>>>>> how.
>>>>>> If you like to set an additional xattr, that would be possible now.
>>>>>> Since we reserve multiple xattrs, we can call lsm_get_xattr_slot()
>>>>>> another time and set SMACK64_TRANSMUTE.
>>>>>>
>>>>>> I think, if the kernel config has CONFIG_EVM_EXTRA_SMACK_XATTRS set,
>>>>>> EVM would protect SMACK64_TRANSMUTE too.
>>>>> Ooookay, but can someone explain to me how either the current, or
>>>>> patched, smack_inode_init_security() function can return multiple
>>>>> xattrs via the security_inode_init_security() LSM hook?
>>>> It can't.
>>> I didn't think so.
>>>
>>> To be really specific, that's what we're talking about with this
>>> patch: the number of xattrs that smack_inode_init_security() can
>>> return to the LSM hook (and EVM, and the caller ...).  If it's only
>>> ever going to be one, I think we can adjust the
>>> 'SMACK_INODE_INIT_XATTRS' down to '1' and save ourselves some
>>> allocation space.
>>
>> Does evm have an expectation that mumble_inode_init_security() is
>> going to report all the relevant attributes? It has to be getting
>> them somehow, which leads me to wonder if we might want to extend
>> smack_inode_init_security() to do so. Even if we did, the maximum
>> value would be '2', SMACK64 and SMACK64_TRANSMUTE. Now that would
>> require a whole lot of work in the calling filesystems, as setting
>> the transmute attribute would be moving out of smack_d_instantiate()
>> and into the callers. Or something like that.
>
> After changing the inode_init_security hook definition to pass the
> full xattr array, this is not going to be a problem. EVM sees all
> xattrs that are going to be set when an inode is created, and adds its
> own too.
>
> If you have enough information to set security.SMACK_TRANSMUTE64 in
> smack_inode_init_security(),

I think there's enough information to do that. I'm going to have to look
at your patch more closely.

> this patch sets already allows to set both xattrs at the same time. We
> would just need to call lsm_get_xattr_slot() another time, assuming
> that we reserve two xattrs.
>
> Roberto
>
