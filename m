From: Tahsin Erdogan <tahsin@google.com>
Subject: Re: [PATCH 30/31] ext4: eliminate xattr entry e_hash recalculation
 for removes
Date: Fri, 16 Jun 2017 19:04:44 -0700
Message-ID: <CAAeU0aMuV7EHw5ZwdF52__baS36CsaB4MN03iqUdyLh1Fc6HzA@mail.gmail.com>
References: <20170614172340.18720-1-tahsin@google.com> <20170615091026.GG1764@quack2.suse.cz>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=Hvg6rO2Y2mi6RCbWRFF3KZCC3RUFKRWS93+OeJvXvK4=;
        b=u0Q7HXMhkyHQasYsy6mwdzv15ENlCYIWV8z8rxYlN4lYajb5AJGbP1s1v9bihJ1fbG
         nAO9v7MuscTtgMYj5wNXIe0m97im8L+SNrH9+pJtS/bixBhneEMWxtCuF7LMoWR2oodU
         daCrc5PIz86RZkt0njlbGmM1REMQVAh9jb0IfFYxtLt/ZLS0FVC4X630/ASbVX57CBKJ
         /NLeRDes6fLtdyyMVmz032lmlVy4oWixpi+QYfc2K8SlxtliDh/Ipydv2ok2jq+W7azJ
         hR/S09nvHJgvROPR5jut0Dsije1SW7+OqJlVTghl9Gqykcz3ckTAEx8YZB+IzVXm0T5s
         6/pg==
In-Reply-To: <20170615091026.GG1764@quack2.suse.cz>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.cz>
Cc: "Darrick J . Wong" <darrick.wong@oracle.com>, Jan Kara <jack@suse.com>, Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, Dave Kleikamp <shaggy@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Mark Fasheh <mfasheh@versity.com>, Joel Becker <jlbec@evilplan.org>, Jens Axboe <axboe@fb.com>, Deepa Dinamani <deepa.kernel@gmail.com>, Mike Christie <mchristi@redhat.com>, Fabian Frederick <fabf@skynet.be>, linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, jfs-discussion@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org

On Thu, Jun 15, 2017 at 2:10 AM, Jan Kara <jack@suse.cz> wrote:
> I agree with moving ext4_xattr_rehash_entry() out of ext4_xattr_rehash().
> However how about just keeping ext4_xattr_rehash() in
> ext4_xattr_block_set() (so that you don't have to pass aditional argument
> to ext4_xattr_set_entry()) and calling ext4_xattr_rehash_entry() when
> i->value != NULL? That would seem easier and cleaner as well...

The is_block parameter is also used to decide whether block reserve
check should be performed:

@@ -1500,8 +1502,8 @@ static int ext4_xattr_set_entry(struct ext4_xattr_info *i,
                 * attribute block so that a long value does not occupy the
                 * whole space and prevent futher entries being added.
                 */
-               if (ext4_has_feature_ea_inode(inode->i_sb) && new_size &&
-                   (s->end - s->base) == i_blocksize(inode) &&
+               if (ext4_has_feature_ea_inode(inode->i_sb) &&
+                   new_size && is_block &&
                    (min_offs + old_size - new_size) <
                                        EXT4_XATTR_BLOCK_RESERVE(inode)) {
                        ret = -ENOSPC;

Because of that, I think moving ext4_xattr_rehash to caller makes it
bit more complicated. Let me know if you disagree.
