From: Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: [PATCH v4 3/5] security: Allow all LSMs to provide xattrs for
 inode_init_security hook
Date: Thu, 17 Nov 2022 09:18:12 -0800
Message-ID: <026075fa-0b58-9041-0727-b75e19499356@schaufler-ca.com>
References: <20221110094639.3086409-1-roberto.sassu@huaweicloud.com>
 <20221110094639.3086409-4-roberto.sassu@huaweicloud.com>
 <4c1349f670dc3c23214a5a5036e43ddaa0a7bc89.camel@linux.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1668705495; bh=bUB+Go+QZbKc+o/akfQR2CSJPJ5Io/Mye21Vk6SdZvY=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=LFc2wh9yKuM3aPvQDJY0c2S+/+VfQNVZyy44BG0NE5LvC6bk3+4q5uFg+Q4YgONc4MWIYCTxvtydpkF0HyBS+ZR6xQrGAt1xfPN2lMdxGNfWm5SR3DJryfoh6Jj9n0SWZcXwV0iwXzQk8nujWzLGSphqSuBfGofsfWaYuIXGtd87Vj3QyvU0LTGjfiz1juim3bmmFxOXC/wdrmYHhfVtppxcUzJ2/5sAqL0rcU0KwbFdLZ5cynYzvgeURNYnT3B3Do5dlFNfHCYYoxcaAOcvs1Ut3C94XPBxw4RwBtaKY9eOhFd12CyjJpECV7mYdA35HHVcHl+Wiils/O3xmTr9og==
Content-Language: en-US
In-Reply-To: <4c1349f670dc3c23214a5a5036e43ddaa0a7bc89.camel@linux.ibm.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mimi Zohar <zohar@linux.ibm.com>, Roberto Sassu <roberto.sassu@huaweicloud.com>, dmitry.kasatkin@gmail.com, paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org
Cc: linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>, casey@schaufler-ca.com

On 11/17/2022 8:05 AM, Mimi Zohar wrote:
> hOn Thu, 2022-11-10 at 10:46 +0100, Roberto Sassu wrote:
>> From: Roberto Sassu <roberto.sassu@huawei.com>
>>
>> Currently, security_inode_init_security() supports only one LSM providing
>> an xattr and EVM calculating the HMAC on that xattr, plus other inode
>> metadata.
>>
>> Allow all LSMs to provide one or multiple xattrs, by extending the security
>> blob reservation mechanism. Introduce the new lbs_xattr field of the
>> lsm_blob_sizes structure, so that each LSM can specify how many xattrs it
>> needs, and the LSM infrastructure knows how many xattr slots it should
>> allocate.
> Perhaps supporting per LSM multiple xattrs is a nice idea, but EVM
> doesn't currently support it.  The LSM xattrs are hard coded in
> evm_config_default_xattrnames[],  based on whether the LSM is
> configured.  Additional security xattrs may be included in the
> security.evm calculation, by extending the list via
> security/integrity/evm/evm_xattrs.

Smack uses multiple xattrs. All file system objects have a SMACK64
attribute, which is used for access control. A program file may have
a SMACK64EXEC attribute, which is the label the program will run with.
A library may have a SMACK64MMAP attribute to restrict loading. A
directory may have a SMACK64TRANSMUTE attribute, which modifies the
new object creation behavior.

The point being that it may be more than a "nice idea" to support
multiple xattrs. It's not a hypothetical situation.

