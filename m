From: Oleg Drokin <green@namesys.com>
Subject: Re: using reiserfs as a DB
Date: Tue, 23 Apr 2002 10:46:41 +0400
Message-ID: <20020423104641.B2930@namesys.com>
References: <20020421205328.GA8407@vega.ipal.net> <20020422172009.A1109@namesys.com> <20020422174449.GC8407@vega.ipal.net> <3CC45294.2060806@priocom.com> <20020422231645.GD8407@vega.ipal.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10140-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020422231645.GD8407@vega.ipal.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Phil Howard <phil-reiserfs@ipal.net>
Cc: Yura Umanets <umanets@priocom.com>, reiserfs-list@namesys.com

Hello!

On Mon, Apr 22, 2002 at 06:16:45PM -0500, Phil Howard wrote:
> | The first component is identifier of directory where given object (file 
> | or directory) lies. Second - identifier of the given object. Third 
> | component - offset inside object. If object is file, then offset is 
> | offset inside this file, if directory - hashed name of first entry in 
> | this direntry. And finally last component is type of the item (statdata, 
> | direntry, direct item, indirect item).
> How is the application going to know what the key is for a particular
> file?  How is the application going to translate what it has as a key,

It seems I used wrong word. What was used to acces files were in fact
md5 sums of their names (the URL in squid case).

> into the kind of key the raw interface uses?  How costly is this lookup?

Once Nikita will appear, he can explain better because he invented the code,
I believe.

Bye,
    Oleg
