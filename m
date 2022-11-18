From: Mimi Zohar <zohar@linux.ibm.com>
Subject: Re: [PATCH v4 4/5] evm: Align evm_inode_init_security() definition
 with LSM infrastructure
Date: Fri, 18 Nov 2022 10:11:56 -0500
Message-ID: <0f03693fab1b885ffb7ccfb9536028e3d8f25322.camel@linux.ibm.com>
References: <20221110094639.3086409-1-roberto.sassu@huaweicloud.com>
         <20221110094639.3086409-5-roberto.sassu@huaweicloud.com>
         <5ff23992ab249af4fd5ef967691f8986c5898583.camel@linux.ibm.com>
         <6e4da6d6-5a0c-98ba-9841-07a316f8631e@huaweicloud.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-security-module-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=iMM5oivNJa+sP0gkSNtngKGpdo00X2aXogAjZxh19+U=;
 b=LK5B5/aqHAmRDp8Jdp/8TXCQMA0ZnKxjAHYTOGzTt6aK/tXUyGdojqLqVYmv/o/vFLWf
 lXLwUp7B/CxTLE7Cgrr+KEFeyaKP7WUFT995b5IetCFFJEmBihIddYwTe1UTw/jVcvtO
 YHyquQSDmtpWz30oSuGd4di+GNfnmOthcwzXUrzEUvYMxSit3KiSmTd4FP8S7jUiMi5W
 p0KuF/b4rdAwgdUvmaf0dGlAU33Oe4IG8+YtDxPshUMwNnJZUivmHd4QWHk0jejvDgsW
 lhNCrIP0FXAOfnb85/chpvhIAdmaQukxeQQEnJ38oJ1V/rp45cxI2WeMyKD30n5LmCuk DA== 
In-Reply-To: <6e4da6d6-5a0c-98ba-9841-07a316f8631e@huaweicloud.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Roberto Sassu <roberto.sassu@huaweicloud.com>, dmitry.kasatkin@gmail.com, paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com
Cc: linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>

On Fri, 2022-11-18 at 10:30 +0100, Roberto Sassu wrote:
> On 11/17/2022 6:07 PM, Mimi Zohar wrote:
> > On Thu, 2022-11-10 at 10:46 +0100, Roberto Sassu wrote:
> >> From: Roberto Sassu <roberto.sassu@huawei.com>
> >>
> >> Change the evm_inode_init_security() definition to align with the LSM
> >> infrastructure, in preparation for moving IMA and EVM to that
> >> infrastructure.
> >>
> >> This requires passing only the xattr array allocated by
> >> security_inode_init_security(), instead of the first LSM xattr and the
> >> place where the EVM xattr should be filled.
> >>
> >> It also requires positioning after the last filled xattr (by checking the
> >> xattr name), since the beginning of the xattr array is given.
> > 
> > Perhaps combine this sentence to the previous paragraph and start the
> > sentence with
> > "In lieu of passing the EVM xattr, ..."
> 
> Ok.
> 
> >> If EVM is moved to the LSM infrastructure, it will use the xattr
> >> reservation mechanism too, i.e. it positions itself in the xattr array with
> >> the offset given by the LSM infrastructure.
> > 
> > The LSM infrastructure will need to support EVM as the last LSM.  Is
> > there a reason for including this comment in this patch description.
> 
> The idea is to first make EVM work like other LSMs, and then add 
> limitations that are EVM-specific.
> 
> As a regular LSM, EVM could be placed anywhere in the list of LSMs. This 
> would mean that whenever EVM is called, it will process xattrs that are 
> set by previous LSMs, not the subsequent ones.
> 
> What we would need to do EVM-specific is that EVM is the last in the 
> list of LSMs, to ensure that all xattrs are protected.
> 
> >> Finally, make evm_inode_init_security() return value compatible with the
> >> inode_init_security hook conventions, i.e. return -EOPNOTSUPP if it is not
> >> setting an xattr.
> > 
> >> EVM is a bit tricky, because xattrs is both an input and an output. If it
> >> was just output, EVM should have returned zero if xattrs is NULL. But,
> >> since xattrs is also input, EVM is unable to do its calculations, so return
> >> -EOPNOTSUPP and handle this error in security_inode_init_security().
> >>
> >> Don't change the return value in the inline function
> >> evm_inode_init_security() in include/linux/evm.h, as the function will be
> >> removed if EVM is moved to the LSM infrastructure.
> >>
> >> Last note, this patch does not fix a possible crash if the xattr array is
> >> empty (due to calling evm_protected_xattr() with a NULL argument). It will
> >> be fixed with 'evm: Support multiple LSMs providing an xattr', as it will
> >> first ensure that the xattr name is not NULL before calling
> >> evm_protected_xattr().
> > 
> >  From my reading of the code, although there might be multiple LSM
> > xattrs, this patch only includes the first LSM xattr in the security
> > EVM calculation.  So it only checks the first xattr's name.  Support
> > for including multiple LSM xattrs in the EVM hmac calculation is added
> > in the subsequent patch.
> 
> I tried to include in this patch just the function definition change and 
> keep the existing behavior.

That's fine.
> 
> The problem is trying to access xattr->name at the beginning of 
> evm_inode_init_security().
> 
> That would disappear in patch 5, where there is a loop checking 
> xattr->value first. Patch 3 disallows combination of NULL name - !NULL 
> value and !NULL name - NULL value. Not sure if the latter is correct 
> (empty xattr?). Will check what callers do.

My comments here and above were for improving the patch description:
- Just say what this patch is doing, not what subsequent changes will
do in the future.  We'll come to that when the time comes.

- Say something only the lines that this patch includes only one LSM
security xattr in the EVM calculation, like previously.

thanks,

Mimi

