From: Mat <jackdachef@gmail.com>
Subject: Re: vs-13070: reiserfs_read_locked_inode during backup (rsync) & much load on VFS
Date: Tue, 26 Aug 2008 14:25:16 +0200
Message-ID: <e85b9d30808260525p4a9d531fja20b4bb39864cf9f@mail.gmail.com>
References: <loom.20080825T132117-502@post.gmane.org>
	 <e85b9d30808250658v6ceb518ajf4f86f29ee0d40aa@mail.gmail.com>
	 <48B31A55.8020304@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=NDZSMQoxHg7ZxzPcc24DEsc024LyFpl8ZyTvm5WOeaw=;
        b=PRO7G8qKkWiFrIemQNWpEYa+4q5vvSSYmJqfR0g3gAQQmVGvzDjvf+09xdVPgySG8m
         76PATQUkaa8MFU+onwfTxBI8fX49fTy/f7S2XbgCxSNN2dWgHCcV5j4akoAiMIRt0qYi
         RbW2YPMEvhIDpR8oYRuT3rxOt13nwtu54m7zk=
In-Reply-To: <48B31A55.8020304@gmail.com>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On Mon, Aug 25, 2008 at 10:47 PM, Edward Shishkin
<edward.shishkin@gmail.com> wrote:
> Matthew wrote:
>> ok, well it turned out to be an USB problem (again !)
>>
> bad cable?

almost ;)
it was a bad usb-hub, strangely those tweaked settings pushed it to
its limits and
therefore would produce those errors more earlier / often than without
(if at all)

by the way:
any news from the Russian company planning to implement reiser4 for
its servers ?

Thanks
Mat
