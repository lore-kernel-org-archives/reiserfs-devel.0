From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH] reiser4: port for Linux-4.5
Date: Wed, 6 Apr 2016 17:23:50 +0200
Message-ID: <57052A06.2020207@gmail.com>
References: <56FB9A57.3040906@gmail.com>
 <1459905738.31752.7.camel@intelfx.name>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding;
        bh=wNL0LmHbK+E4n6dBL3NA2p0lynX918c8ZxkZ3uUdOUc=;
        b=EZtnLesRcX8Ad5zgutxSwF4K3yPbwVGOMcJVsF9b4CCpyWBI71Akb04U0hvzFAhW4z
         YJY67WZQ6de2cQztYWh00dTvbYxVJrnvVxcxBpaLlpOOyxEK0r0mFuVMKMWNI10YIJ8Q
         kBYtTzjZGDOax2XI1KQ/Zjso55F8TQAYKxzUvat6avgeic9mD7/p63dle+arqYksvpew
         1e1gehPtiTB+nngKKRoy9hqLccs3E38h/ZY6N718SpLMpEimwqK6Fl1Rb/4dM6Sj2U/J
         hsgPOprTct13kYo7HarcgreitTsHsQd878LyMclAlZdvMXITLi98lFm6QoK/coFFMDoS
         DEkg==
In-Reply-To: <1459905738.31752.7.camel@intelfx.name>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: intelfx@intelfx.name, Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>

On 04/06/2016 03:22 AM, Ivan Shapovalov wrote:
> On 2016-03-30 at 11:20 +0200, Edward Shishkin wrote:
>> . Adjust for the new ->get_link() of vfs's inode_operations: we don't
>>     support RCU mode;
>> . check returned value of __copy_from_user() to make gcc happy
>>     (the path is never invoked) in create_item_node40().
>>
>> Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
> By the way: I've noticed many times that the resulting squashed patch
> which you put on sourceforge is _different_ from what can be composed
> using incremental patches you send on the ML.


I never announced any peculiar properties of the patches that I
send to the mailing list. This is mostly for me (to look at the mail
archive and to refresh memory.


>
> Maybe you could finally consider having a git repo somewhere (e. g. on
> github)? It would be much easier to work with the code (and, for me in
> particular, to learn how it works) this way.


I'll consider it sooner or later, since all Namesys archives are
git-based, but it seems that probably "later", because currently I am
very busy..

Edward.
