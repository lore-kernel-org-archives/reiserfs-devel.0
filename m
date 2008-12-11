From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: The reiser4 ....SDK for experiments outside kernel
Date: Thu, 11 Dec 2008 22:10:28 +0300
Message-ID: <494165A4.6040207@gmail.com>
References: <494035ED.4000706@gmx.de> <49404165.6050806@gmail.com> <494062F6.2040809@gmx.de> <4940FB0E.8050102@gmx.de> <494105EB.3080204@gmx.de> <80294dc60812110636m70178aa3m4493e65fe4be302e@mail.gmail.com> <ghrhkn$9ht$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <ghrhkn$9ht$1@ger.gmane.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ralph <eulenreich@gmx.de>
Cc: reiserfs-devel@vger.kernel.org

Ralph wrote:
> Alexander Lyamin wrote:
>   
>>> 1. to adapt linux vfs behaviors
>>>       
>> it does.
>> actually  VFS implementation is a plugin.
>>     
>
> Hi Alexander,
>
> I am not a kernel-hacker, but I would like to 
> experiment with plugins. Is there a reiser4-SDK like thing 
> that enables me to easily setup a reiser4 partition in a bigfile and 
> to run a demon which makes my yet to program plugins accessible?
>   

What this tricky business is for?
Does everyone need this?

Be careful with the notion of plugin: in reiser4 this is only
to manage low-level data storage infrastructure.. That said,
first, you should decide what (useful!) feature related to
(low-level!) data storage do you want to implement, then think
how to implement it in the plugin categories. Most likely you'll
need to add new plugin(s) of existing or (unlikely) new interface.
For example, in order to support (meta)data checksums you'll need
a new node format, and, hence, new node plugin (the NODE interface
already exists).
All other "plugins" should go to vfs, or to various stackable
(distributed) filesystems.

Edward.
