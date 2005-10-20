From: Alexander Zarochentsev <zam@namesys.com>
Subject: Re: how to apply lates reiser4 broken-out patch ?
Date: Thu, 20 Oct 2005 10:13:26 +0400
Message-ID: <200510201013.27096.zam@namesys.com>
References: <001101c5d51e$333391c0$0300a8c0@JUICE1>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_HWzVDAKXz3kreO/"
Return-path: <reiserfs-list-return-26577-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <001101c5d51e$333391c0$0300a8c0@JUICE1>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com
Cc: Artur =?iso-8859-1?q?Mak=F3wka?= <juice@ursynow.2a.pl>

--Boundary-00=_HWzVDAKXz3kreO/
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thursday 20 October 2005 06:30, Artur Mak=F3wka wrote:
> hi, how can i apply all patches that are inside broken-out package (for
> reiser4 2.6.13) ? also, what does it mean in practice this "broken-out" ?

the patches should be applied in order as in the 'series' file.=20

I know two things which can do that:
1) simple apply-us script (attached), just=20
	cd linux-2.6.13
	apply-us  <path to broken-out set>

2) patch management scripts by Andrew Morton

Hmm, the namesys' broken-out set contains 'serie'.  Please rename that file=
 to=20
'series' for allowing the above tools to work.

> ( i know its not reiser questoin, the second one, but i maybe someone will
> answer anyways)
>
> sorry for such basic questions, but there is no description on reiser
> website how to deal with many patches, in what order should i patch them ,
> or why  there is no 1 release with all patched already applied )
>
> thanks in advance

=2D-=20
Alex.

--Boundary-00=_HWzVDAKXz3kreO/
Content-Type: application/x-shellscript;
  name="apply-us"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename="apply-us"

#! /bin/sh

OPTVAL=`getopt -o Rv -n 'apply-us' -- "$@"`

# Note the quotes around `$OPTVAL': they are essential!
eval set -- "$OPTVAL"

reverse=0
verbose=0
while true ;do
	case "$1" in
		-R)
			reverse=1
			shift
		;;
		-v)
			verbose=$(($verbose + 1))
			shift
		;;
		--) 
			shift
			break
		;;
		*) 
			echo "Internal error!" 
			exit 1
		;;
	esac
done

dir=$1
series=$dir/series

if [ $reverse -gt 0 ] ;then
	cmd="tac"
	opt="-R"
else
	cmd="cat"
	opt=""
fi

$cmd $series | while read ;do
	case $REPLY in
		\#*)
			continue
		;;
	esac
	pname=$dir/$REPLY
	if [ -f "$pname" ] ;then
		echo -n Checking $pname...
		patch -p1 --dry-run $opt < $pname > /dev/null 2>&1 || exit 1
		echo ok
		patch -p1 $opt < $pname || exit 2
	fi
done

--Boundary-00=_HWzVDAKXz3kreO/--
