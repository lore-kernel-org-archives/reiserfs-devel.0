From: Mengchi Cheng <mengcc@amazon.com>
Subject: Re: [PATCH] Smack modifications for: security: Allow all LSMs to provide xattrs for inode_init_security hook
Date: Tue, 9 May 2023 16:44:12 -0700
Message-ID: <20230509234412.3073389-1-mengcc@amazon.com>
References: <2d0abd075d6c67e72e3fb88a4c163fb0dd28f72e.camel@huaweicloud.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-unionfs-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1683675874; x=1715211874;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CUuCRv/NUzjgRIBeu2VwsSSjZsjxeEv5ZWd8kul32w8=;
  b=YLBtAwfwmPXkWMBPqecSX0IUeh6cgNk7zh7ahJNT3sY2NQzBPEDyx9+D
   9vL+69M9ZgWPAoICxuRyGfqpMeUgsbZb/A6/HnoF2geN1cuXzw0QgXueV
   iRmyGXhAoLbIi4cc6WO+nNEKvpQCSm43JATDS+1Uq46Uvuj7KJwdpNlY4
   w=;
In-Reply-To: <2d0abd075d6c67e72e3fb88a4c163fb0dd28f72e.camel@huaweicloud.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: roberto.sassu@huaweicloud.com
Cc: bpf@vger.kernel.org, casey@schaufler-ca.com, dmitry.kasatkin@gmail.com, eparis@parisplace.org, jmorris@namei.org, kamatam@amazon.com, keescook@chromium.org, kpsingh@kernel.org, linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, linux-unionfs@vger.kernel.org, mengcc@amazon.com, miklos@szeredi.hu, nicolas.bouchinet@clip-os.org, paul@paul-moore.com, reiserfs-devel@vger.kernel.org, roberto.sassu@huawei.com, selinux@vger.kernel.org, serge@hallyn.com, stephen.smalley.work@gmail.com, yoonjaeh@amazon.com, zohar@linux.ibm.com

On Mon, 2023-05-08 12:29:42 +0000, Roberto Sassu wrote:
>
> On Thu, 2023-04-20 at 10:48 +0200, Roberto Sassu wrote:
> > On Wed, 2023-04-19 at 12:25 -0700, Mengchi Cheng wrote:
> > > > I got some errors during xattr removal, so not sure if my patch was
> > > > working properly or not (it happened also without it, didn't
> > > > investigate more).
> > > > 
> > > > However, I saw another discussion related to transmute:
> > > > 
> > > > https://lore.kernel.org/linux-security-module/20230419002338.566487-1-mengcc@amazon.com/
> > > > 
> > > > I add the people in CC.
> > > > 
> > > > The steps described were so easy to understand and executed, I tried
> > > > without and with overlayfs.
> > > > 
> > > > Without:
> > > > 
> > > > # echo "_ system rwxatl" > /sys/fs/smackfs/load2
> > > > # mkdir /data
> > > > # chsmack -a "system" /data
> > > > # chsmack -t /data
> > > > # mkdir -p /data/dir1/dir2
> > > > # chsmack /data/dir1
> > > > /data/dir1 access="system" transmute="TRUE"
> > > > # chsmack /data/dir1/dir2
> > > > /data/dir1/dir2 access="system" transmute="TRUE"
> > > > 
> > > > It seems to work, right?
> > > > 
> > > > With overlay fs it didn't work, same result as the one Mengchi
> > > > reported. Since Mengchi's solution was to set SMK_INODE_CHANGED, and I
> > > > want to get rid of it, I thought to investigate more.
> > > > 
> > > > Looking at smack_dentry_create_files_as(), I see that the label of the
> > > > process is overwritten with the label of the transmuting directory.
> > > > 
> > > > That causes smack_inode_init_security() to lookup the transmuting rule
> > > > on the overridden credential, and not on the original one.
> > > > 
> > > > In the example above, it means that, when overlayfs is creating the new
> > > > inode, the label of the process is system, not _. So no transmute
> > > > permission, and also the xattr will not be added, as observed by
> > > > Mengchi.
> > > > 
> > > > Hopefully I undertood the code, so in this particular case we would not
> > > > need to override the label of the process in smack_dentry_create_files_
> > > > as().
> > > > 
> > > > If you see smack_inode_init_security():
> > > > 
> > > > 	struct smack_known *skp = smk_of_current();
> > > > 	struct smack_known *isp = smk_of_inode(inode);
> > > > 	struct smack_known *dsp = smk_of_inode(dir);
> > > > 
> > > > [...]
> > > > 
> > > > 		if (may > 0 && ((may & MAY_TRANSMUTE) != 0) &&
> > > > 		    smk_inode_transmutable(dir)) {
> > > > 			isp = dsp;
> > > > [...]
> > > > 
> > > > 		xattr->value = kstrdup(isp->smk_known, GFP_NOFS);
> > > > 
> > > > This code is telling, if there is a transmute rule, and the directory
> > > > is transmuting, set the label of the new inode to the label of the
> > > > directory. That should be already the result that we wanted to obtain.
> > > > 
> > > > The current code should have been doing it by overriding the label of
> > > > the process in smack_dentry_create_files_as() with the label of the
> > > > parent directory, and letting the inode being created with the
> > > > overridden label of the process. The transmute xattr is not set due to
> > > > the problem described above.
> > > > 
> > > > So, as a quick test, I kept this patch with the change to xattr2->name, 
> > > > and skipped the label override in smack_dentry_create_files_as(). It
> > > > worked, I get the same result as without overlayfs. Wondering if the
> > > > process label override is necessary in other cases.
> > > 
> > > If I understand correctly, removing the if block below is what you suggested.
> > 
> > Yes, more or less is what I did.
> > 
> > > diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
> > > index cfcbb748da25..a867288e9de9 100644
> > > --- a/security/smack/smack_lsm.c
> > > +++ b/security/smack/smack_lsm.c
> > > @@ -4769,8 +4769,8 @@ static int smack_dentry_create_files_as(struct dentry *dentry, int mode,
> > >                  * providing access is transmuting use the containing
> > >                  * directory label instead of the process label.
> > >                  */
> > > -               if (may > 0 && (may & MAY_TRANSMUTE))
> > > -                       ntsp->smk_task = isp->smk_inode;
> > > +//             if (may > 0 && (may & MAY_TRANSMUTE))
> > > +//                     ntsp->smk_task = isp->smk_inode;
> > >         }
> > >         return 0;
> > >  }
> > > 
> > > This way will have issue in the following situation on the vanila kernel.
> > > data in the lowerdir has "_" label before overlay and dir1 is already
> > > created in the lowerdir.
> > > # chsmack /data
> > > /data access="_"
> > > # chsmack /data/dir1
> > > /data/dir1 access="system" transmute="TRUE"
> > > Apply overlay on data directory and set the smack rule in the same way.
> > > data has the same smack label.
> > > # chsmack /data
> > > /data access="system" transmute="TRUE"
> > 
> > I'm using an older kernel, but I get _ instead of system.
> > 
> > > After that, remove dir1 and mkdir dir1 again. dir1 did not get the correct
> > > label.
> > > # rm -r /data/dir1
> > > # mkdir -p /data/dir1
> > > # chsmack /data/dir1
> > > /data/dir1 access="_"
> > 
> > Unfortunately, it cannot work:
> > 
> > Thread 3 hit Breakpoint 1, smack_inode_init_security (...) at security/smack/smack_lsm.c:959
> > 959	{
> > (gdb) p dir->i_ino
> > $12 = 9169116
> > (gdb) p dsp
> > $13 = (struct smack_known *) 0xffffffff831fc0a0 <smack_known_floor>
> > 
> > 
> > ls -i /home/root/data_work/
> > 9169116 work
> > 
> > So, transmuting is decided on the working directory.
> 
> Actually, after studying the code better, this is
> what security_dentry_create_files_as() is useful for.
> 
>  * Compute a context for a dentry as the inode is not yet available and set
>  * that context in passed in creds so that new files are created using that
>  * context. Context is calculated using the passed in creds and not the creds
>  * of the caller.
> 
> And Smack is doing:
> 
> 		if (may > 0 && (may & MAY_TRANSMUTE)) {
> 			ntsp->smk_task = isp->smk_inode;
> 
> The new inode will be created with the label of the current task, that
> was replaced with the label of the parent directory (see above) in smac
> k_dentry_create_files_as().
> 
> I think the reason why Mengchi was not obtaining the desired label when
> replacing /data/dir1 was because /data is incorrectly labeled.
> 
> To ensure that /data has label 'system' and transmute is true, I added
> smackfstransmute=system to the mount options.
> 
> However, at the beginning, it seemed that it didn't work:
> 
> # mount -t overlay overlay -o lowerdir=/data,upperdir=/home/root/data,workdir=/home/root/data_work,smackfstransmute=system /data
> # chsmack /data
> /data access="system"
> 
> I found that the reason for this is that smack_inode_getsecurity()
> retrieves metadata from the inode only for SMACK64, and the rest from
> xattrs (which would not work for mount options). I just made a patch to
> handle SMACK64TRANSMUTE too.
> 
> With the patch applied, I correctly get:
> 
> # mount -t overlay overlay -o lowerdir=/data,upperdir=/home/root/data,workdir=/home/root/data_work,smackfstransmute=system /data
> # chsmack /data
> /data access="system" transmute="TRUE"
> 
> With the root inode correctly labeled, I get:
> 
> # mount -t overlay overlay -o lowerdir=/data,upperdir=/home/root/data,workdir=/home/root/data_work,smackfstransmute=system /data
> # rm -Rf /data/dir1
> # mkdir /data/dir1
> # chsmack /data/dir1
> /data/dir1 access="system"
> 
> This is partially correct, transmute="TRUE" is missing.
> 
> Judging from smk_task, we cannot determine in smack_inode_init_security
> () if transmuting was successful in smack_dentry_create_files_as(). We
> need an extra information.
> 
> Mengchi's solution was to add the new inode as parameter
> to security_dentry_create_files_as(), so that SMK_INODE_CHANGED can be
> set in smk_flags, and SMACK64TRANSMUTE is set in smack_d_instantiate().
> 
> One concern could be that preallocating the inode maybe is overlayfs-
> specific? A comment also says that we might not use that one:

security_dentry_create_files_as() is only referred in the fs/overlayfs/dir.c.
inode is for sure preallocated in this case.
I am glad you find a way without modifying security api. I did some tests
with your patch on our system. It works as expected. I am ok to drop mine.

Best,
Mengchi

> 
> 	err = ovl_create_or_link(dentry, inode, &attr, false);
> 	/* Did we end up using the preallocated inode? */
> 	if (inode != d_inode(dentry))
> 
> We could achieve the same goal without adding a new parameter to security_dentry_create_files_as() and, instead, by adding a new field
> in the task_smack structure, smk_transmuted, that is set to smk_task
> when transmuting is successful.
> 
> Then, if smk_task == smk_transmuted, smack_inode_init_security() would
> set SMK_INODE_CHANGED. On top of that, I would instead just provide the
> second xattr SMACK64TRANSMUTE, in addition to SMACK64.
> 
> Will send the patches for upstream first, and then switch to providing 
> SMACK64TRANSMUTE in smack_inode_init_security(), in a new version of
> the EVM patch set.
> 
> Thanks
> 
> Roberto
> 
> > If I do:
> > 
> > # chsmack -a system -t /home/root/data_work/work/
> > # mkdir /data/dir1
> > # chsmack /data/dir1
> > /data/dir1 access="system" transmute="TRUE"
> > 
> > I obtain the expected result. However, this problem is due to how overlayfs works:
> > 
> > static int ovl_create_over_whiteout(struct dentry *dentry, struct inode *inode,
> > 				    struct ovl_cattr *cattr)
> > {
> > 
> > [...]
> > 
> > 	newdentry = ovl_create_temp(ofs, workdir, cattr);
> > 	err = PTR_ERR(newdentry);
> > 	if (IS_ERR(newdentry))
> > 		goto out_dput;
> > 
> > 
> > The good news seems to be that, once you set the label to the correct
> > directory, transmuting works with the changes I proposed.
> > 
> > Roberto
> > 
> > > Since I am not very familiar your change. Could you help check with your
> > > patch will this issue also happen? 
> > > 
> > > 
> > > Best,
> > > Mengchi
> > > 
> > > >  
> > > > Roberto
> 
> 
