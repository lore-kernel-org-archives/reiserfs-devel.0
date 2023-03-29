From: Roberto Sassu <roberto.sassu@huaweicloud.com>
Subject: Re: [PATCH v8 4/6] security: Allow all LSMs to provide xattrs for
 inode_init_security hook
Date: Wed, 29 Mar 2023 09:11:59 +0200
Message-ID: <e7faa6ebe2958184aeccadad51d18877577b225b.camel@huaweicloud.com>
References: <20230314081720.4158676-1-roberto.sassu@huaweicloud.com>
         <20230314081720.4158676-5-roberto.sassu@huaweicloud.com>
         <CAHC9VhTD3EyDiJs9+NQrgp84JcUs_sx8WONtRk2YYH4m1C8nVw@mail.gmail.com>
         <939e6c88662ad90b963993c4cc1b702083e74a7a.camel@huaweicloud.com>
         <ffc86b3907f7b87d3c568ae62bea3cdb3275be4e.camel@huaweicloud.com>
         <CAHC9VhRNjvjMOF5KLM6BoGfk=QpEBs_ur_CgRdGL5R1bA-JAwg@mail.gmail.com>
         <8b63d00d8ac3f686e51889ea4fc8d83f8ecb300d.camel@huaweicloud.com>
         <CAHC9VhRaKtsM=CuNhDy0Kx0NGSUrVhG+MhwKnHiyJxfgUwx7nA@mail.gmail.com>
         <1e08006f9011efa48deaf656c358ca3d438b9768.camel@huaweicloud.com>
         <CAHC9VhRNWeZtxain_Hi-EfS49Vac8_vg7KRRyV4a9Sq3XPhZsg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <CAHC9VhRNWeZtxain_Hi-EfS49Vac8_vg7KRRyV4a9Sq3XPhZsg@mail.gmail.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Paul Moore <paul@paul-moore.com>
Cc: mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com, zohar@linux.ibm.com, dmitry.kasatkin@gmail.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com, ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, linux-kernel@vger.kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>

On Tue, 2023-03-28 at 16:19 -0400, Paul Moore wrote:
> On Tue, Mar 28, 2023 at 3:47 AM Roberto Sassu
> <roberto.sassu@huaweicloud.com> wrote:
> > On Mon, 2023-03-27 at 17:02 -0400, Paul Moore wrote:
> > > On Mon, Mar 27, 2023 at 3:30 AM Roberto Sassu
> > > <roberto.sassu@huaweicloud.com> wrote:
> > > > On Fri, 2023-03-24 at 17:39 -0400, Paul Moore wrote:
> > > > > On Fri, Mar 24, 2023 at 9:26 AM Roberto Sassu
> > > > > <roberto.sassu@huaweicloud.com> wrote:
> > > > > > On Fri, 2023-03-24 at 11:18 +0100, Roberto Sassu wrote:
> > > > > > > On Thu, 2023-03-23 at 20:09 -0400, Paul Moore wrote:
> > > > > > > > On Tue, Mar 14, 2023 at 4:19 AM Roberto Sassu
> > > > > > > > <roberto.sassu@huaweicloud.com> wrote:
> > > > > > > > > From: Roberto Sassu <roberto.sassu@huawei.com>
> 
> ...
> 
> > > Okay, that's fair, but we could still pass the full xattrs array and a
> > > reference to the current count which could be both read and updated by
> > > the individual LSMs, right?
> > 
> > Yes, we could do.
> > 
> > > The issue is that the separate compaction stage is not something we
> > > want to have to do if we can avoid it.  Maybe we're stuck with it, but
> > > I'm not yet convinced that we can't make some minor changes to the
> > > LSMs to avoid the compaction step.
> > 
> > I liked more the idea that LSMs do what they are most familiar with,
> > get an offset in a security blob or, in this case, a starting slot in
> > the new_xattrs array, and write there.
> > 
> > v3 had the lsm_find_xattr_slot() helper, to get the starting slot, but
> > somehow I find it less intuitive.
> > 
> > Ok, if you prefer to avoid the compaction stage, I will rewrite this
> > patch.
> 
> My concern is having to look through the xattr array after each LSM
> has been run and in at least one case having to then do a memcpy() to
> keep the array packed.  There are some cases where there is no way to
> avoid all that extra work, but here I think we have the LSMs do the
> Right Thing with respect to packing the xattr array without overly
> burdening the individual LSMs.
> 
> Does that make sense?  It basically comes down to being smart about
> our abstractions and both selectively, and carefully, breaking them
> when there is a reasonable performance gain to be had.

Yes, ok, it is a good approach.

Thanks

Roberto

