From: Roberto Sassu <roberto.sassu@huaweicloud.com>
Subject: Re: [PATCH] Smack modifications for: security: Allow all LSMs to
 provide xattrs for inode_init_security hook
Date: Thu, 20 Apr 2023 16:10:42 +0200
Message-ID: <5a9ba6618b37a592cda13ce36ea35cf78c98122b.camel@huaweicloud.com>
References: <c7f38789-fe47-8289-e73a-4d07fbaf791d@schaufler-ca.com>
         <20230411172337.340518-1-roberto.sassu@huaweicloud.com>
         <2dc6486f-ce9b-f171-14fe-48a90386e1b7@schaufler-ca.com>
         <8e7705972a0f306922d8bc4893cf940e319abb19.camel@huaweicloud.com>
         <72b46d0f-75c7-ac18-4984-2bf1d6dad352@schaufler-ca.com>
         <82ee6ddf66bb34470aa7b591df4d70783fdb2422.camel@huaweicloud.com>
         <91f05dc4-a4b7-b40a-ba1a-0ccc489c84b2@schaufler-ca.com>
         <5c50d98f1e5745c88270ae4ad3de6d9a803db4c6.camel@huaweicloud.com>
         <48c6073f-59b0-f5d1-532e-fe4b912b939d@schaufler-ca.com>
         <0fccab67e496f10f4ee7bf2220e70a655013935f.camel@huaweicloud.com>
         <c16dd895-f488-241d-0be8-e56e5f0c1adb@schaufler-ca.com>
         <a98ddf946c474a3500bdcd72766c6cb0043278ff.camel@huaweicloud.com>
         <97849695ef53ab3186e59d8a2c6b74812f13ee19.camel@linux.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-unionfs-owner@vger.kernel.org>
In-Reply-To: <97849695ef53ab3186e59d8a2c6b74812f13ee19.camel@linux.ibm.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mimi Zohar <zohar@linux.ibm.com>, Casey Schaufler <casey@schaufler-ca.com>, dmitry.kasatkin@gmail.com, paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, bpf@vger.kernel.org, kpsingh@kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>, Mengchi Cheng <mengcc@amazon.com>, miklos@szeredi.hu, linux-unionfs@vger.kernel.org, kamatam@amazon.com, yoonjaeh@amazon.com

On Thu, 2023-04-20 at 06:44 -0400, Mimi Zohar wrote:
> On Thu, 2023-04-20 at 10:50 +0200, Roberto Sassu wrote:
> > > It's possible. It's been a long time since I've looked at this.
> > > I'm tempted to take a change to make overlayfs work upstream and
> > > then worry about the ima changes. There seems to be a lot more
> > > going on with the ima changes than is obvious from what's in the
> > > Smack code.
> 
> It doesn't sound like the patch set introduces the overlayfs bug.

Correct.

The first problem of overlayfs is that smack_dentry_create_files_as()
override the credentials in a way that transmuting is not detected
correctly anymore in smack_inode_init_security(). The process label is
already overwritten with the directory label, at the time smack_inode_i
nit_security() calls smk_access_entry(), so the latter will not find
the transmuting rule that refers to the original process label.

The second problem is that overlayfs temporarily creates the new
directory in the working directory, that does not necessarily have the
same label of the parent directory the new file/directory will be added
to, causing the transmuting to be computed incorrectly.

> The security_inode_init_security() change to initialize multiple LSMs
> and IMA xattrs and include them in the EVM hmac calculation is straight
> forward.
> 
> In addition, the patch set creates the infrastructure for allowing
> multiple per LSM xattrs, as requested, to be initialized in
> security_inode_init_security() and included in the EVM hmac.
> 
> Mimi
> 
> > We could also set only SMACK64 in smack_inode_init_security(), and move
> > SMACKTRANSMUTE64 later, when we figure out how to fix the case of
> > overlayfs.
> > 
> > IMA and EVM would work in both cases.

Thanks to Mimi, I realized that adding SMACKTRANSMUTE64 in
smack_inode_init_security() is actually necessary.
Calling __vfs_getxattr() in smack_d_instantiate() causes the xattr to
be added without EVM updating the HMAC (thus, making the HMAC invalid).

Thanks

Roberto

