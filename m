From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: Fibration questions
Date: Fri, 23 Jul 2004 12:42:42 +0300
Message-ID: <20040723094242.GL4990@nysv.org>
References: <40FE0B47.3010600@slaphack.com> <20040721063607.1A09015C92@mail03.powweb.com> <20040721083232.GA4990@nysv.org> <40FF3DAD.6020100@slaphack.com> <20040722100657.GC4990@nysv.org> <41007BC6.3060209@slaphack.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19770-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <41007BC6.3060209@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Masover <ninja@slaphack.com>
Cc: David Dabbs <david@dabbs.net>, reiserfs-list@namesys.com

On Thu, Jul 22, 2004 at 09:45:26PM -0500, David Masover wrote:
>| UPDATE formatting SET policy='never\0' WHERE policy='smart\0' RECURSE;
>| instead of just
>| UPDATE formatting SET policy='never\0' RECURSE;
>| which may break something else...
>
>Both should be allowed.  Can that be done now?  And with echo, not SQL.

I can't check now but maybe:

for dir in $(find . -type d); do
  format=$(cat $dir/..metas/plugin/formatting)
  if [ $format == "smart\0" ]; then
    echo -e 'never\0' > $format
    for file in $(find $dir -type f); do
      cat file > /dev/null
    done
  fi
done

IIRC the access required to change the file's formatting policy on the
file system was read-only. If you actually had to change something, replace
cat with chmod +x && chmod -x or something.

Namesys guys want to comment?-)

-- 
mjt

