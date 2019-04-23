From: Bharath Vedartham <linux.bhar@gmail.com>
Subject: Re: [PATCH] reiserfs: Force type conversion in xattr_hash
Date: Tue, 23 Apr 2019 20:25:21 +0530
Message-ID: <20190423145521.GB3609@bharath12345-Inspiron-5559>
References: <20190417115200.GA10168@bharath12345-Inspiron-5559>
 <20190418155019.ab5189e4e317df2b36861012@linux-foundation.org>
 <20190421170235.GI2217@ZenIV.linux.org.uk>
 <20190422122705.9df141f5c9b4e842e170e72a@linux-foundation.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Y2qVkcnIUTAOloMt/bR+PD8mCA6y24Iai13NIuYAAx0=;
        b=cSxP5So5UPVb4bYO41L1CXSjd3gFYSy5Zdqfmft6gpiY7zMBiSJG3D1hWOPtjwRa8q
         xV9bQi2egy/ecTiAq1oOwbrPbxvmcspZlpLqXk0Bgo3ah4DMidMn6vLgmWE2xwXi+hyQ
         D0ZuFNDtokw8r/Ae/U/U0dMf4ySFMoiuwL85EghyenjfpSsLFKP2gIUl9B5OWqqHCXtU
         XqF0h04byjZ40mbFx0tIu6VOHVqLRSLaZGkG5QJRIBxBXEaogvVsT+K5FNQf/Q7AhdqQ
         /H7YUFUc4uXKOi2dVsUdhrMegVRLJeNUZcVxTNriu3tvu8w9FYyf4tK3im18ZuRyWcdp
         9MQA==
Content-Disposition: inline
In-Reply-To: <20190422122705.9df141f5c9b4e842e170e72a@linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, jannh@google.com, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Apr 22, 2019 at 12:27:05PM -0700, Andrew Morton wrote:
> On Sun, 21 Apr 2019 18:02:35 +0100 Al Viro <viro@zeniv.linux.org.uk> wrote:
> 
> > IOW, what sparse has caught here is a genuine endianness bug; images
> > created on little-endian host and mounted on big-endian (or vice
> > versa) will see csum mismatches when trying to fetch xattrs.
> 
> OK, thanks.  I'll drop the patch - we shouldn't hide that reminder of a
> bug.
> 
> Perhaps someone could prepare a patch which adds a comment explaining
> these issues, so someone else doesn't try to "fix" the sparse warning.
>

Hi Andrew,

I will send a patch CCing Al to add a comment explaining these issues.

Thanks
Bharath
