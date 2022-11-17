From: Mimi Zohar <zohar@linux.ibm.com>
Subject: Re: [PATCH v4 3/5] security: Allow all LSMs to provide xattrs for
 inode_init_security hook
Date: Thu, 17 Nov 2022 13:07:37 -0500
Message-ID: <5ef79a7ab559f46313f767d90b50662e003d62be.camel@linux.ibm.com>
References: <20221110094639.3086409-1-roberto.sassu@huaweicloud.com>
         <20221110094639.3086409-4-roberto.sassu@huaweicloud.com>
         <4c1349f670dc3c23214a5a5036e43ddaa0a7bc89.camel@linux.ibm.com>
         <026075fa-0b58-9041-0727-b75e19499356@schaufler-ca.com>
         <6b4d47765a4ddcfdf07158f3ad0737fa3aa5823e.camel@linux.ibm.com>
         <66df8ebe-1ed2-c839-8a5f-cc0a26bad6c3@schaufler-ca.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-security-module-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=DJWVbLBThfA4r5Xc8cljs2uNQs/ONt++ArGyQv7sJFw=;
 b=hgJNePoo0ERFfc7qezYZNPQsZGdxi/W430q6D8xfUhpQyKmRN00HwsfVOY3jq06eTysT
 Vyu3wXV8i7MdI1ba1BkH4o7BhEG59/HCB/jUhT03rCacX7Hm+xQlmz0oYFLA5O9CHUjs
 Muw3JYbdeKkgD8mjZ62Eb9/IXXsX69XBCVD2I+ZSFtfiIQ/VFg+EgRC9kTBic5jWBIfH
 wF2xrldJuoV056nfe4FAs49nU8+VI4vC5NYCNPOiygmf5ISq+MpxwH9rJJIS0TrLAhUM
 a+jwmFXrS7Lx4RTjoTRFyyCx1bdyp7ZcVsD4Ctj8Let14D6NdMSkbfXMh8QK+a5hqEmt 1w== 
In-Reply-To: <66df8ebe-1ed2-c839-8a5f-cc0a26bad6c3@schaufler-ca.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Casey Schaufler <casey@schaufler-ca.com>, Roberto Sassu <roberto.sassu@huaweicloud.com>, dmitry.kasatkin@gmail.com, paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org
Cc: linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>

On Thu, 2022-11-17 at 09:40 -0800, Casey Schaufler wrote:
> On 11/17/2022 9:24 AM, Mimi Zohar wrote:
> > On Thu, 2022-11-17 at 09:18 -0800, Casey Schaufler wrote:
> >> On 11/17/2022 8:05 AM, Mimi Zohar wrote:
> >>> hOn Thu, 2022-11-10 at 10:46 +0100, Roberto Sassu wrote:
> >>>> From: Roberto Sassu <roberto.sassu@huawei.com>
> >>>>
> >>>> Currently, security_inode_init_security() supports only one LSM providing
> >>>> an xattr and EVM calculating the HMAC on that xattr, plus other inode
> >>>> metadata.
> >>>>
> >>>> Allow all LSMs to provide one or multiple xattrs, by extending the security
> >>>> blob reservation mechanism. Introduce the new lbs_xattr field of the
> >>>> lsm_blob_sizes structure, so that each LSM can specify how many xattrs it
> >>>> needs, and the LSM infrastructure knows how many xattr slots it should
> >>>> allocate.
> >>> Perhaps supporting per LSM multiple xattrs is a nice idea, but EVM
> >>> doesn't currently support it.  The LSM xattrs are hard coded in
> >>> evm_config_default_xattrnames[],  based on whether the LSM is
> >>> configured.  Additional security xattrs may be included in the
> >>> security.evm calculation, by extending the list via
> >>> security/integrity/evm/evm_xattrs.
> >> Smack uses multiple xattrs. All file system objects have a SMACK64
> >> attribute, which is used for access control. A program file may have
> >> a SMACK64EXEC attribute, which is the label the program will run with.
> >> A library may have a SMACK64MMAP attribute to restrict loading. A
> >> directory may have a SMACK64TRANSMUTE attribute, which modifies the
> >> new object creation behavior.
> >>
> >> The point being that it may be more than a "nice idea" to support
> >> multiple xattrs. It's not a hypothetical situation.
> > And each of these addiitonal Smack xattrs are already defined in 
> > evm_config_default_xattrnames[].
> 
> Then I'm confused by the statement that "EVM doesn't currently support it".

My mistake.  As you pointed out, Smack is defining multiple security
xattrs.

Mimi

