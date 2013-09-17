From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 GIT and Kernel 3.11 patchs
Date: Tue, 17 Sep 2013 21:52:31 +0200
Message-ID: <5238B2FF.5060900@gmail.com>
References: <20130917181531.Horde.9SQoJsAfOsciOtEfGaP2jA1@mail.thieu.so>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=kXI8NHXmo94xcif8a0qIaGstHORhyCDmO5RinDmOvD8=;
        b=baPvCyWD/ul2XOhuuCxKKhJPdmXPS/Cd7twQLTVNpU6vZZhM+grFYKbFIQl+M/Lx4F
         /FznS0KBv7B/RcPaCyUPJ2ayFlUwZ+4+4RzGlKzd3bnl1rMSXoGbtZhq9DUo1Q2OaY92
         pe/XbUDO4n5iTt00i0JcdUpwG1zjrs4jmwB9Qx7NBWDNJlzc+iNVkab4jGjQIdqz0gZj
         5GQN/R88kVjwGQKBmdEYzzvKpKWT3bqyRQqVnLcvhp1b7LffQQjUXlTlZL8VfjazTBRX
         OEZjlmyxc/apitKuWCDkH2puTh4J/LnXrX1dz5cv0ni8mtnXOTY+pc+KekwfEmAMFWk5
         jzDg==
In-Reply-To: <20130917181531.Horde.9SQoJsAfOsciOtEfGaP2jA1@mail.thieu.so>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mathieu Belanger <m@thieu.so>
Cc: reiserfs-devel@vger.kernel.org

On 09/17/2013 08:15 PM, Mathieu Belanger wrote:
>
> Hello,
>
> I made reiser4 for kernel 3.11-rc4 patchs some time ago and I did not 
> publish them due to a small issue I got with them and did not have 
> time to debug it.


Yeah, it's a pity...


>
> I think it would be a good idea to have a GIT or any kind of work 
> collaboration tool so people don't redo what other people do on there 
> side but instead do it in a way so other can see and fix/improve it 
> faster.
>
> I think that the best way would be to put the last vanilla patched 
> with reiser4 and work on it that way (so it's will be simple to simply 
> generate the reiser4 patch from the git + vanilla)


It must be a good idea...


Thanks,
Edward.

>
> I can set it up tonight (will update my patch to the latest 3.11, 
> instead of rc4, in the same time).
>
> -- 
> Mathieu Belanger

