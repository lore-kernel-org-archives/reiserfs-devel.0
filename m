From: Roberto Sassu <roberto.sassu@huaweicloud.com>
Subject: Re: [PATCH v10 2/4] security: Allow all LSMs to provide xattrs for
 inode_init_security hook
Date: Thu, 6 Apr 2023 11:08:07 +0200
Message-ID: <4d5b98a2-64a0-2126-08de-64a8c4b46884@huaweicloud.com>
References: <20230331123221.3273328-1-roberto.sassu@huaweicloud.com>
 <20230331123221.3273328-3-roberto.sassu@huaweicloud.com>
 <CAHC9VhSbGdij6xz9D49my37kD9qYrBmh2x7=cNFFDL2dZ=EZTw@mail.gmail.com>
 <5dbb9430-1e26-ec12-26a2-3718c84e33c2@schaufler-ca.com>
 <7549b624-421e-30b9-ca99-de42929354c7@huaweicloud.com>
 <CAHC9VhTsSUM6_g5+ZOqZ=P6307hCAJW+-xEc4fKQcymPs5pYjQ@mail.gmail.com>
 <83ddfcb9-b4a6-71b4-a20c-62f484c8e040@schaufler-ca.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-security-module-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <83ddfcb9-b4a6-71b4-a20c-62f484c8e040@schaufler-ca.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Casey Schaufler <casey@schaufler-ca.com>, Paul Moore <paul@paul-moore.com>
Cc: zohar@linux.ibm.com, dmitry.kasatkin@gmail.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, bpf@vger.kernel.org, kpsingh@kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>

On 4/5/2023 10:43 PM, Casey Schaufler wrote:
> On 4/5/2023 12:59 PM, Paul Moore wrote:
>> On Wed, Apr 5, 2023 at 5:44 AM Roberto Sassu
>> <roberto.sassu@huaweicloud.com> wrote:
>>> On 4/5/2023 4:08 AM, Casey Schaufler wrote:
>>>> On 4/4/2023 11:54 AM, Paul Moore wrote:
>>>>> On Fri, Mar 31, 2023 at 8:33 AM Roberto Sassu
>>>>> <roberto.sassu@huaweicloud.com> wrote:
>> ..
>>
>>>>>> diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
>>>>>> index cfcbb748da2..8392983334b 100644
>>>>>> --- a/security/smack/smack_lsm.c
>>>>>> +++ b/security/smack/smack_lsm.c
>>>>>> @@ -52,6 +52,15 @@
>>>>>>    #define SMK_RECEIVING  1
>>>>>>    #define SMK_SENDING    2
>>>>>>
>>>>>> +/*
>>>>>> + * Smack uses multiple xattrs.
>>>>>> + * SMACK64 - for access control, SMACK64EXEC - label for the program,
>>>>> I think it would be good to move SMACK64EXEC to its own line; it took
>>>>> me a minute to figure out why SMACK_INODE_INIT_XATTRS was set to '4'
>>>>> when I only say three comment lines ... ;)
>>>>>
>>>>>> + * SMACK64MMAP - controls library loading,
>>>>>> + * SMACK64TRANSMUTE - label initialization,
>>>>>> + * Not saved on files - SMACK64IPIN and SMACK64IPOUT
>>>>>> + */
>>>>>> +#define SMACK_INODE_INIT_XATTRS 4
>>>>> If smack_inode_init_security() only ever populates a single xattr, and
>>>>> that is the only current user of SMACK_INODE_INIT_XATTRS, can we make
>>>>> this '1' and shrink the xattr allocation a bit?
>>>> If the parent directory is marked with SMACK64_TRANSMUTE, the access
>>>> rule allowing the access has the "t" mode, and the object being initialized
>>>> is a directory, the new inode should get the SMACK64_TRANSMUTE attribute.
>>>> The callers of security_inode_init_security() don't seem to care.
>>>> I can't say if the evm code is getting SMACK64_TRANSMUTE or, for that
>>>> matter, SMACK64_EXEC and SMACK64_MMAP, some other way. The older system
>>>> allowed for multiple Smack xattrs, but I'm not clear on exactly how.
>>> If you like to set an additional xattr, that would be possible now.
>>> Since we reserve multiple xattrs, we can call lsm_get_xattr_slot()
>>> another time and set SMACK64_TRANSMUTE.
>>>
>>> I think, if the kernel config has CONFIG_EVM_EXTRA_SMACK_XATTRS set,
>>> EVM would protect SMACK64_TRANSMUTE too.
>> Ooookay, but can someone explain to me how either the current, or
>> patched, smack_inode_init_security() function can return multiple
>> xattrs via the security_inode_init_security() LSM hook?
> 
> It can't.
> 
>>    I'm hoping
>> I'm missing something really obvious, but I can only see a single
>> Smack xattr being returned ...
> 
> Smack is setting the transmute attribute in smack_d_instantiate().
> The exec and mmap attributes are always set explicitly.
> 
> I don't know how the "extra" Smack attributes were obtained by evm
> before, and I haven't been looking at how they're doing it now.
> I have assumed that CONFIG_EVM_EXTRA_SMACK_XATTRS does something
> meaningful.

EVM has a list of xattrs to protect. Without 
CONFIG_EVM_EXTRA_SMACK_XATTRS, EVM protects only security.SMACK64. With 
it, also the other Smack xattrs.

EVM calculates the HMAC of xattrs from that list at inode creation time 
(during the execution of security_inode_init_security(), after other 
LSMs) and during set/remove xattrs operations on the VFS.

Currently, Smack provides only security.SMACK64, so I agree with Paul 
that we should reserve as many xattr as we use. If in the future, we add 
security.SMACK_TRANSMUTE64, we can increase the number of reserved 
xattrs to 2.

Roberto

