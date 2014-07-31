From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4: FITRIM ioctl -- where to place the handler?
Date: Thu, 31 Jul 2014 23:37:34 +0200
Message-ID: <53DAB71E.5020303@gmail.com>
References: <1888625.Xe1HFmG7T5@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=Yo0fYHYGDAzibGRzTGCURSDgWAg/XgHRmAQayGxoU1M=;
        b=WcdryJ5OnHsV7+6qKlWLMWnZEaxkYnLSxQ7COIrkumK9P+03JJOWBh8IuQQpH50weO
         TwJBxDz/kD+4RQNXEiu54FMeTho+B7z2jXcxp98kpVF2N1ywa0KtGqCakgYZDOjvH3xf
         NvlwUFMK1WrWYcO4yemEduelhx1yV41V4bRGspIUtxJOjBQlS0DWMACaeAJCSJdFj4Ez
         y6v9+CJD+PV9Zb5xtumlaeKrrdW2ntw2EQlMeY8nJTKgNtJC9PhkC9w+DxXAN+mJzxJv
         4kk1LrHsmsRBzZcaaGO5Bp6F1R7ODkK7hppL2PaFilbOYsTbAgkdPYi2BWnCe4Sl3wCY
         3XxQ==
In-Reply-To: <1888625.Xe1HFmG7T5@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel@vger.kernel.org

Do we really need this ioctl?
If we implement precise discard (with garbage collection),
then I don't see any applications for this ioctl..

Edward.


On 07/31/2014 04:23 PM, Ivan Shapovalov wrote:
> Hi,
>
> I've started to iterate on the batch mode discard implementation for reiser4,
> and the first question is -- where to place the ioctl handler?
>
>  From what I've been able to understand, we need something like
> reiser4_ioctl_dir_common() in plugin/file_ops.c, pointer to which should
> become ->{unlocked,compat}_ioctl() of directory_f_ops in plugin/object.c.
>
> However, in this case, what is DIRECTORY_FILE_PLUGIN_ID and corresponding
> entry in file_plugins array in plugin/object.c? How is it related to
> directories?
>
> I see that its ->{inode,file,as}_ops are empty, so it probably does not
> participate in dispatching ioctls, but I'd like to make sure this is the case.
>
> Thanks,

