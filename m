From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [Bug 3.4.5] reiserfs: mutex_destroy called with locked mutex
Date: Wed, 18 Jul 2012 09:26:57 -0700
Message-ID: <CA+55aFzv5mntf6y9e_r5=v+beG19xBv67EpA=dP0-Zw1CQrGGg@mail.gmail.com>
References: <5006491D.8070004@t-online.de>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:from:date
         :x-google-sender-auth:message-id:subject:to:cc:content-type;
        bh=VLIlbPC/SGrJX+0Eba0/ac0Ea5h4AaZNC9eTtr2sNIQ=;
        b=Fg5T9Jv7OTe73HEBeuqwOSgxG6oyH72sgEDw4tc9tNL3/Ua7KI1Gc4aplMzaCaXgjR
         vQVAdnG3/w0WbFcRzBdvVpHqlW8eFsnkfM3wg0FpCzL202+9Mox2bHIdGKXIAZScj6S9
         397KqErlSFw3BqqcDgZiM/RNk70zyN0sefgyBwmnP9woZSE/Z+S/XGNECEsX6ozl8e8J
         WP8TVWkLRemz5BIvGjnJx7jbU7vhlRuLVdoK/xsu8h0mJfnOfSj4cQC6kVr+rGBnP8Rl
         RCYppGCF4W7LPaOub9bvopY7XnA81hA0wllvhsAT90dsLtaT/xDb/MyYvh0SYyGQBjID
         1taA==
In-Reply-To: <5006491D.8070004@t-online.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Knut Petersen <Knut_Petersen@t-online.de>, Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org

On Tue, Jul 17, 2012 at 10:26 PM, Knut Petersen
<Knut_Petersen@t-online.de> wrote:
> I hit the following problem during a heavy compile job on kernel 3.4.5:

I think it's triggered by the fact that reiserfs does

        d_instantiate(dentry, inode);
        unlock_new_inode(inode);

ie it does the "unlock_new_inode()" *after* it has already made the
inode visible to others in the filesystem. So you can now have a
concurrent lookup of that dentry that finds the (locked) inode before
"unlock_new_inode()" has had the chance to set the lockdep class.
Also, since it's been instantiated, the only *valid* inode pointer is
in the dentry, so the code really really shouldn't use the "inode"
pointer any more because the refcount has been transferred to the
dentry. So maybe memory pressure could turn the dentry negative (and
free the inode) while the unlock_new_inode() code runs.

fs/ext[23]/namei.c has the same pattern, though, and I think it should
be harmless (the inode is marked I_NEW and we get the i_lock for
unlock_new_inode, so the freeing code should know to keep away from
it). So I don't think the freeing code could trigger, but a concurrent
lookup then trying to look up the new directory (and taking the new
directory i_semaphore lock) could happen, afaik.

So I think we should re-order the d_instantiate/unlock_new_inode calls. Al?

                   Linus
