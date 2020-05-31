From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [ANNOUNCE] Reiser5: Data Tiering. Burst Buffers. Speedup
 synchronous modifications
Date: Sun, 31 May 2020 20:34:25 +0200
Message-ID: <a0a2176a-9abc-ed26-6f6c-726936f90607@gmail.com>
References: <4f919dee-5b72-9269-2bd0-6818a7167864@gmail.com>
 <20200530101354.GA630@duo.ucw.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bdBmKyLMgyuSYHluLaPWhpBjUBM5iB5qL+jjoSfvNLc=;
        b=IFwh45aJIHiUdXpnhbN2j6fgO4LZZLQuDrlbKE3QlSWYbyfc/fy+sWUop5+ZiKAbPu
         q71sC8PqSUnLUKaT4iII8Mbw7LCHRZVYblIp1GFzr9ie8eCwnL1RuEDTAxNRCFT+0Hip
         rfaXbM+9h4Wl5SlBRx1c/AI9b+mL8yszp1wUP0I+jN53od36CQYN9AgjbMF7ManDAsep
         aVIvuPx4A8JzyKXmVk7d/n4RNnIYqm2fCknUHoEtOBSPmp+LMlANGWiNJhTf45xxRPSf
         plsNmQjTLjzrVsT1D27OUKvZHKiFQ8BXNfScnmmzlfco0QxM/XrqO8AostdysiB17V8x
         eOEQ==
In-Reply-To: <20200530101354.GA630@duo.ucw.cz>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pavel Machek <pavel@ucw.cz>
Cc: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

On 05/30/2020 12:13 PM, Pavel Machek wrote:
> Hi!
> 
> 
>> For example, you can use proxy device to store hot data only. With
>> such strategy new logical blocks (which are always "cold") will always
>> go to the main storage (in contrast with Burst Buffers, where new
>> logical blocks first get written to the proxy disk). Once in a while
>> you need to scan your volume in order to push colder data out, and
>> pull hotter data in the proxy disk. Reiser5 contains a common
>> interface for this. It is possible to maintain per-file, or even per-
>> blocks-extent "temperature" of data (e.g. as a generation counter),
> 
> Would it be possible to offer userland interface for this? I can
> probably say that mp3/video files should be cold, while some source
> files should be hot, etc...
> 
> Best regards,
> 									Pavel
> 

Hi Pavel,

Yes, it is possible. One just needs to add an ioctl handler for regular
files managed by a plugin with STRIPED_FILE_PLUGIN_ID. That handler is
to set user-defined "temperature" to a file.

Also we'll need an additional on-disk file attribute (32 (or 64?)-bit
field in the private part of inode) to store the "temperature" in. It
can be added by standard way via implementation of respective stat-data
extension in the file reiser4/plugin/item/static_stat.c

Finally, we'll need to handle temperature in the common migration
procedure balance_volume_asym(), which is responsible for clearing up
the proxy device. It should look like this:

...

if (!IS_ERR(inode) && inode_file_plugin(inode)->balance &&
     file_is_cold_enough(inode)) {
		reiser4_iget_complete(inode);
		/*
		 * migrate data blocks of this file
		 */
...

Currently it works as if all files are "cold" (i.e. migrates
everything).

Once I find the current stuff more-or-less stable I'll add temperature
support and send the patch.

Thanks,
Edward.
