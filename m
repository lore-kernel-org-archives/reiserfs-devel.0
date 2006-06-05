From: Edward Shishkin <edward@namesys.com>
Subject: Re: Selecting unixfile plugin
Date: Mon, 05 Jun 2006 13:21:21 +0400
Message-ID: <4483F791.7020608@namesys.com>
References: <1149491181.3926.59.camel@sam>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28725-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1149491181.3926.59.camel@sam>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ben Martin <monkeyiq@users.sourceforge.net>
Cc: reiserfs-list@namesys.com

Ben Martin wrote:

>Hi,
>  
>

Hello

>  After much digging around as to how to use the reiser4 compression
>plugin I have found this message.
>http://marc.theaimsgroup.com/?l=reiserfs&m=113190018626958&w=2
>
>I'm using 2.6.15 + resier4 + metas patches.
>
>I'm trying to set the default plugin to cryptcompress for a directory in
>a r4 filesystem.
>
>It seems that the plugins/regular is thought to be a directory when I 
>echo "cryptcompress\0" >|plugins/regular
>
>Trying various combinations of things inside regular/ like echoing into
>label etc don't seem to have an effect when read back again.
>
>It seems from the below link and grepping the 2.6.15 reiser4 patch that
>echoing "cryptcompress" >| mydir/..../plugins/regular/label
>should make new files in mydir use the cryptcompress plugin by defualt.
>http://www.namesys.com/cryptcompress-related_plugins.html
>
>The info like http://www.namesys.com/cryptcompress_design.html seems to
>be targetted toward developers rather than users. Are there any
>references or logs of command line interactions to enable and tweak
>compression/crypto aimed at end user consumption?
>
>  
>

Yes, it is. Although this stuff should be qualified as experimental.
If you have spare disk space and another box with serial connection,
then we will send you the setup..

Edward.

>Also from what I've seem a 
>sed s/metas/..../g 
>might be in order for
>http://www.namesys.com/v4/pseudo.html
>
>
>  
>

