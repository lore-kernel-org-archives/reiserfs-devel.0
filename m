From: Oleg Drokin <green@namesys.com>
Subject: Re: corrupted 3.5 format fs
Date: Thu, 22 Aug 2002 09:43:56 +0400
Message-ID: <20020822094356.A1660@namesys.com>
References: <20020822063512.54daaeaf.philippe.gramoulle@mmania.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11281-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20020822063512.54daaeaf.philippe.gramoulle@mmania.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Philippe Gramoull? <philippe.gramoulle@mmania.com>
Cc: reiserfs <reiserfs-list@namesys.com>

Hello!

On Thu, Aug 22, 2002 at 06:35:12AM +0200, Philippe Gramoull? wrote:

> So , i did and re-ran --check and came with still 1 corruption left that was
> said to be able to be corrected with --fix-fixable.
> Re-ran --fix-fixable and --check , and i still had this '1 corruption found
> which can be fixed with --fix-fixable'
> bad_stat_data: block 38372, [3955 5371 0x0 SD (0)], SD has bad nlink number

SOmetimes it is hard to tell whenever corruption that looks like it can be fixed
at --fix-fixable will be fixed at this stage or not.
Of course it is a bug taht fix-fixable does not recommend to use
--rebuild-tere.
Currently this is a rule of thumb that if you get corruptions after
--fix-fixable stage, you should run --rebuild-tree.

> http://philippemm.multimania.com/reiserfs/3.5_var_corrupted_fs.txt
> and the gzipped metadata here;
> http://philippemm.multimania.com/reiserfs/metadata.gz

Got it, thank you.

Bye,
    Oleg
