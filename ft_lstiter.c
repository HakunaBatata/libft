/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_lstiter.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: skunz <skunz@student.42.us.org>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/10/05 19:23:26 by skunz             #+#    #+#             */
/*   Updated: 2018/10/05 19:23:28 by skunz            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	ft_lstiter(t_list *lst, void (*f)(t_list *elem))
{
	if (lst && f)
	{
		while (lst)
		{
			f(lst);
			lst = lst->next;
		}
	}
}

// void	uf_iter_callback(t_list *v)
// {
// 	*(size_t*)v->content = *(size_t*)v->content + 1;
// }

// #include <stdio.h>

// int main()
// {
// 	t_list	*begin;
// 	size_t	v;
// 	size_t	w;

// 	v = 1;
// 	w = 2;
// 	begin = ft_lstnew(&v, sizeof(size_t));
// 	begin->next = ft_lstnew(&w, sizeof(size_t));
// 	ft_lstiter(begin, uf_iter_callback);
// 	printf("%lu\n", *(size_t*)begin->content);
// 	printf("%lu\n", *(size_t*)begin->next->content);

// 	if (*(size_t*)begin->content != 2)
// 		printf("Error 1");
// 	if (*(size_t*)begin->next->content != 3)
// 		printf("Error 2");

// 	free(begin->next);
// 	free(begin);

// 	return (0);
// }
