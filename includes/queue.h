/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   queue.h                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: skunz <skunz@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/02/19 22:28:09 by skunz             #+#    #+#             */
/*   Updated: 2019/02/20 11:43:44 by skunz            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef QUEUE_H
# define QUEUE_H

# include "libft.h"

typedef	struct	s_queue
{
	t_list	*first;
	t_list	*last;
}				t_queue;

t_queue			*init_queue(void);
void			enqueue(t_queue *queue, void *content, size_t content_size);
void			*dequeue(t_queue *queue);
void			*front(t_queue *queue);
int				is_empty(t_queue *queue);

#endif
