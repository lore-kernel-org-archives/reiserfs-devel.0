From: Enrique Perez-Terron <enrique.perez-terron@norway.online.no>
Subject: Re: V4 status
Date: Fri, 05 Dec 2003 00:33:38 +0100
Message-ID: <1070580817.8344.140.camel@arabia.home.lan>
References: <16333.14692.61778.304155@pc7.dolda2000.com>
	 <3FCD47C4.50500@ninja.dynup.net> <3FCE39B8.20307@namesys.com>
	 <16334.15412.686909.927196@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16232-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16334.15412.686909.927196@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Wed, 2003-12-03 at 20:40, Nikita Danilov wrote:
...
>  > > (for example, I should be able to do 'touch file; ls file'), I have 
>  > > had two problems there.  First, ls seems to know it's a file, and so I 
>  > > can't see any files within it.  Second, it needs the executable bit, 
... 
> Another problem ("ls seems to know it's a file") is with user level
> programs that are sometimes too smart.

What happens on v4 if you do "ls -l file/." ?

Regards, Enrique

