From: Edward Shushkin <edward@namesys.com>
Subject: Re: Several questions about encrypted filesystem
Date: Tue, 17 Jun 2003 15:41:20 +0400
Sender: edward
Message-ID: <3EEEFE60.4C86EEE6@namesys.com>
References: <3AA03342E913FA4BA6D8BD0732BFC74B020F443A@pdsmsx402.pd.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14580-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Zhao, Forrest" <forrest.zhao@intel.com>
Cc: reiserfs-list@namesys.com

"Zhao, Forrest" wrote:
> 
> Hi,
> 
> 
> 
> I'm a new comer to Reiserfs list and have several questions about
> encrypted filesystem:
> 
> 
> 
> 1 From the mail list, I know that Reiserfs can encrypt and compress
> individual file and directory. I'd like to know Does Reiserfs support
> encrypting the entire partition and even the whole root fs?

Reiserfs (version 3) doesn't support neither compression nor encryption.
It is supposed to be implemented in reiser4 for individual files (and 
maybe directories). Perhaps we'll develop a scenario when file system 
looks for a secret key in the key token of the process, inherited from 
its parent.   

> 
> 
> 
> 2 what's the difference between the encryption mechanism behind Reiserfs
> and other loopback device-based encryption implementation?

file system can perform encryption on suitable layer (in flush-and-commit
time), it means an advantage.

Thanks, 
Edward.

> 
> 
> 
> Thanks in advance
> 
> 
> 
> Forrest
